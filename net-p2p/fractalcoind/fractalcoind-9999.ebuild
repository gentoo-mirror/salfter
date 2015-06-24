# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="fractalcoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Fractalcoin daemon"
HOMEPAGE="https://github.com/fractalcoin/fractalcoin"
SRC_URI="
"
EGIT_PROJECT='fractalcoin'
EGIT_REPO_URI="https://github.com/fractalcoin/fractalcoin"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="examples logrotate test upnp +wallet"

RDEPEND="
	>=dev-libs/boost-1.52.0[threads(+)]
	dev-libs/openssl:0[-bindist]
	logrotate? (
		app-admin/logrotate
	)
	upnp? (
		net-libs/miniupnpc
	)
	wallet? (
		sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	)
	virtual/bitcoin-leveldb
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

pkg_setup() {
	local UG='fractalcoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/fractalcoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}/0.9.0-sys_leveldb.patch"
	epatch "${FILESDIR}/leveldbwrapper-memenv.patch"
	rm -r src/leveldb 
	eautoreconf
}

src_configure() {
	econf \
		--disable-ccache \
		$(use_with upnp miniupnpc) $(use_enable upnp upnp-default) \
		$(use_enable test tests)  \
		$(use_enable wallet)  \
		--with-system-leveldb  \
		--without-cli \
		--with-daemon \
		--without-gui
}

src_compile() {
	emake || die
	cd "${WORKDIR}/${P}/contrib/debian/manpages" && \
	  mv bitcoin.conf.5 fractalcoin.conf.5 && \
	  mv bitcoind.1 fractalcoind.1 && \
	  mv bitcoin-qt.1 fractalcoin-qt.1 || die	
	cd "${WORKDIR}/${P}/contrib" && \
	  mv bitcoind.bash-completion fractalcoind.bash-completion || die
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	rm "${D}/usr/bin/test_fractalcoin"

	insinto /etc/fractalcoin
	newins "${FILESDIR}/fractalcoin.conf" fractalcoin.conf
	fowners fractalcoin:fractalcoin /etc/fractalcoin/fractalcoin.conf
	fperms 600 /etc/fractalcoin/fractalcoin.conf

	newconfd "${FILESDIR}/fractalcoin.confd" ${PN}
	newinitd "${FILESDIR}/fractalcoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/fractalcoind.service"

	keepdir /var/lib/fractalcoin/.fractalcoin
	fperms 700 /var/lib/fractalcoin
	fowners fractalcoin:fractalcoin /var/lib/fractalcoin/
	fowners fractalcoin:fractalcoin /var/lib/fractalcoin/.fractalcoin
	dosym /etc/fractalcoin/fractalcoin.conf /var/lib/fractalcoin/.fractalcoin/fractalcoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{fractalcoind.1,fractalcoin.conf.5}

	newbashcomp contrib/${PN}.bash-completion ${PN}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/fractalcoind.logrotate" fractalcoind
	fi
}

# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="digitalcoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Digitalcoin daemon"
HOMEPAGE="https://github.com/DGCDev/digitalcoin"
SRC_URI="
"
EGIT_PROJECT='digitalcoin'
EGIT_REPO_URI="https://github.com/DGCDev/digitalcoin"

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
	local UG='digitalcoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/digitalcoin "${UG}"
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
	  mv bitcoin.conf.5 digitalcoin.conf.5 && \
	  mv bitcoind.1 digitalcoind.1 && \
	  mv bitcoin-qt.1 digitalcoin-qt.1 || die	
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	rm "${D}/usr/bin/test_digitalcoin"

	insinto /etc/digitalcoin
	newins "${FILESDIR}/digitalcoin.conf" digitalcoin.conf
	fowners digitalcoin:digitalcoin /etc/digitalcoin/digitalcoin.conf
	fperms 600 /etc/digitalcoin/digitalcoin.conf

	newconfd "${FILESDIR}/digitalcoin.confd" ${PN}
	newinitd "${FILESDIR}/digitalcoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/digitalcoind.service"

	keepdir /var/lib/digitalcoin/.digitalcoin
	fperms 700 /var/lib/digitalcoin
	fowners digitalcoin:digitalcoin /var/lib/digitalcoin/
	fowners digitalcoin:digitalcoin /var/lib/digitalcoin/.digitalcoin
	dosym /etc/digitalcoin/digitalcoin.conf /var/lib/digitalcoin/.digitalcoin/digitalcoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{digitalcoind.1,digitalcoin.conf.5}

	newbashcomp contrib/debian/${PN}.bash-completion ${PN}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/digitalcoind.logrotate" digitalcoind
	fi
}

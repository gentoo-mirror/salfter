# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-r3 user versionator systemd

MyPV="${PV/_/}"
MyPN="anoncoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Anoncoin daemon"
HOMEPAGE="https://github.com/Anoncoin/anoncoin"
SRC_URI="
"
EGIT_PROJECT='anoncoin'
EGIT_REPO_URI="https://github.com/Anoncoin/anoncoin"

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
	local UG='anoncoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/anoncoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}/0.9.0-sys_leveldb.patch"
	epatch "${FILESDIR}/leveldbwrapper-memenv.patch"
	epatch "${FILESDIR}/miniupnpc.patch"
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
		--without-utils \
		--with-daemon \
		--without-gui
}

src_compile() {
	emake || die
	cd "${WORKDIR}/${P}/contrib/debian/manpages" && \
	  mv bitcoin.conf.5 anoncoin.conf.5 && \
	  mv bitcoind.1 anoncoind.1 && \
	  mv bitcoin-qt.1 anoncoin-qt.1 || die	
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	insinto /etc/anoncoin
	newins "${FILESDIR}/anoncoin.conf" anoncoin.conf
	fowners anoncoin:anoncoin /etc/anoncoin/anoncoin.conf
	fperms 600 /etc/anoncoin/anoncoin.conf

	newconfd "${FILESDIR}/anoncoin.confd" ${PN}
	newinitd "${FILESDIR}/anoncoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/anoncoind.service"

	keepdir /var/lib/anoncoin/.anoncoin
	fperms 700 /var/lib/anoncoin
	fowners anoncoin:anoncoin /var/lib/anoncoin/
	fowners anoncoin:anoncoin /var/lib/anoncoin/.anoncoin
	dosym /etc/anoncoin/anoncoin.conf /var/lib/anoncoin/.anoncoin/anoncoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{anoncoind.1,anoncoin.conf.5}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/anoncoind.logrotate" anoncoind
	fi
}

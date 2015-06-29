# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="zetacoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Zetacoin daemon"
HOMEPAGE="https://github.com/zetacoin/zetacoin"
SRC_URI="
"
EGIT_PROJECT='zetacoin'
EGIT_REPO_URI="https://github.com/zetacoin/zetacoin"

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
	local UG='zetacoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/zetacoin "${UG}"
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
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	rm "${D}/usr/bin/test_zetacoin"

	insinto /etc/zetacoin
	newins "${FILESDIR}/zetacoin.conf" zetacoin.conf
	fowners zetacoin:zetacoin /etc/zetacoin/zetacoin.conf
	fperms 600 /etc/zetacoin/zetacoin.conf

	newconfd "${FILESDIR}/zetacoin.confd" ${PN}
	newinitd "${FILESDIR}/zetacoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/zetacoind.service"

	keepdir /var/lib/zetacoin/.zetacoin
	fperms 700 /var/lib/zetacoin
	fowners zetacoin:zetacoin /var/lib/zetacoin/
	fowners zetacoin:zetacoin /var/lib/zetacoin/.zetacoin
	dosym /etc/zetacoin/zetacoin.conf /var/lib/zetacoin/.zetacoin/zetacoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/zetacoind.logrotate" zetacoind
	fi
}

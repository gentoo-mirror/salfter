# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="viacoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Viacoin daemon and CLI"
HOMEPAGE="https://github.com/viacoin/viacoin"
SRC_URI="
"
EGIT_PROJECT='viacoin'
EGIT_REPO_URI="https://github.com/viacoin/viacoin"

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
	local UG='viacoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/viacoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}/0.9.0-sys_leveldb.patch"
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
		--with-cli \
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

	rm "${D}/usr/bin/test_viacoin"

	insinto /etc/viacoin
	newins "${FILESDIR}/viacoin.conf" viacoin.conf
	fowners viacoin:viacoin /etc/viacoin/viacoin.conf
	fperms 600 /etc/viacoin/viacoin.conf

	newconfd "${FILESDIR}/viacoin.confd" ${PN}
	newinitd "${FILESDIR}/viacoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/viacoind.service"

	keepdir /var/lib/viacoin/.viacoin
	fperms 700 /var/lib/viacoin
	fowners viacoin:viacoin /var/lib/viacoin/
	fowners viacoin:viacoin /var/lib/viacoin/.viacoin
	dosym /etc/viacoin/viacoin.conf /var/lib/viacoin/.viacoin/viacoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/viacoind.logrotate" viacoind
	fi
}

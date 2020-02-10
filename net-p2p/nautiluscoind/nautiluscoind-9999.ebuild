# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="5.1"

inherit autotools bash-completion-r1 db-use eutils git-r3 user versionator systemd

MyPV="${PV/_/}"
MyPN="nautiluscoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Nautiluscoin daemon"
HOMEPAGE="https://github.com/nautiluscoin/nautiluscoin"
SRC_URI="
"
EGIT_PROJECT='nautiluscoin'
EGIT_REPO_URI="https://github.com/nautiluscoin/nautiluscoin"

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
	local UG='nautiluscoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/nautiluscoin "${UG}"
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

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	rm "${D}/usr/bin/test_nautiluscoin"

	insinto /etc/nautiluscoin
	newins "${FILESDIR}/nautiluscoin.conf" nautiluscoin.conf
	fowners nautiluscoin:nautiluscoin /etc/nautiluscoin/nautiluscoin.conf
	fperms 600 /etc/nautiluscoin/nautiluscoin.conf

	newconfd "${FILESDIR}/nautiluscoin.confd" ${PN}
	newinitd "${FILESDIR}/nautiluscoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/nautiluscoind.service"

	keepdir /var/lib/nautiluscoin/.nautiluscoin
	fperms 700 /var/lib/nautiluscoin
	fowners nautiluscoin:nautiluscoin /var/lib/nautiluscoin/
	fowners nautiluscoin:nautiluscoin /var/lib/nautiluscoin/.nautiluscoin
	dosym /etc/nautiluscoin/nautiluscoin.conf /var/lib/nautiluscoin/.nautiluscoin/nautiluscoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{nautiluscoind.1,nautiluscoin.conf.5}

	newbashcomp contrib/${PN}.bash-completion ${PN}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/nautiluscoind.logrotate" nautiluscoind
	fi
}

# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="acoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Acoin daemon"
HOMEPAGE="https://github.com/acoin-project/acoin"
SRC_URI="
"
EGIT_PROJECT='acoin'
EGIT_REPO_URI="https://github.com/acoin-project/acoin"

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
	local UG='acoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/acoin "${UG}"
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

	rm "${D}/usr/bin/test_acoin"

	insinto /etc/acoin
	newins "${FILESDIR}/acoin.conf" acoin.conf
	fowners acoin:acoin /etc/acoin/acoin.conf
	fperms 600 /etc/acoin/acoin.conf

	newconfd "${FILESDIR}/acoin.confd" ${PN}
	newinitd "${FILESDIR}/acoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/acoind.service"

	keepdir /var/lib/acoin/.acoin
	fperms 700 /var/lib/acoin
	fowners acoin:acoin /var/lib/acoin/
	fowners acoin:acoin /var/lib/acoin/.acoin
	dosym /etc/acoin/acoin.conf /var/lib/acoin/.acoin/acoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/acoind.logrotate" acoind
	fi
}

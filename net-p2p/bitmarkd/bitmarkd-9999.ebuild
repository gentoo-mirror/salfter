# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="bitmark"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Bitmark daemon"
HOMEPAGE="https://github.com/project-bitmark/bitmark"
SRC_URI="
"
EGIT_PROJECT='bitmark'
EGIT_REPO_URI="https://github.com/project-bitmark/bitmark"

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
	local UG='bitmark'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/bitmark "${UG}"
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

	rm "${D}/usr/bin/test_bitmark"

	insinto /etc/bitmark
	newins "${FILESDIR}/bitmark.conf" bitmark.conf
	fowners bitmark:bitmark /etc/bitmark/bitmark.conf
	fperms 600 /etc/bitmark/bitmark.conf

	newconfd "${FILESDIR}/bitmark.confd" ${PN}
	newinitd "${FILESDIR}/bitmark.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/bitmarkd.service"

	keepdir /var/lib/bitmark/.bitmark
	fperms 700 /var/lib/bitmark
	fowners bitmark:bitmark /var/lib/bitmark/
	fowners bitmark:bitmark /var/lib/bitmark/.bitmark
	dosym /etc/bitmark/bitmark.conf /var/lib/bitmark/.bitmark/bitmark.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md

	newbashcomp contrib/${PN}.bash-completion ${PN}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/bitmarkd.logrotate" bitmarkd
	fi
}

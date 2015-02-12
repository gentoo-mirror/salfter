# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="dogecoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Dogecoin "
HOMEPAGE="http://dogecoin.com/"
SRC_URI="
"
EGIT_PROJECT='dogecoin'
EGIT_REPO_URI="git://github.com/dogecoin/dogecoin.git https://github.com/dogecoin/dogecoin.git"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="test upnp"

RDEPEND="
	>=dev-libs/boost-1.52.0[threads(+)]
	dev-libs/openssl:0[-bindist]
	upnp? (
		net-libs/miniupnpc
	)
	virtual/bitcoin-leveldb
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

pkg_setup() {
	local UG='dogecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/dogecoin "${UG}"
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
		--without-daemon \
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

	rm "${D}/usr/bin/test_dogecoin"
}

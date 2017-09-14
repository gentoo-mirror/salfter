# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/litecoind/litecoind-0.10.2.2.ebuild,v 1.3 2015/07/11 13:54:41 blueness Exp $

EAPI=5

DB_VER="4.8"

inherit autotools db-use eutils systemd user

MyPV="${PV/_/-}"
MyPN="litecoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="P2P Internet currency based on Bitcoin but easier to mine"
HOMEPAGE="https://litecoin.org/"
SRC_URI="https://github.com/${MyPN}-project/${MyPN}/archive/v${MyPV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="logrotate upnp"

RDEPEND="
	dev-libs/boost[threads(+)]
	dev-libs/openssl:0[-bindist]
	logrotate? ( app-admin/logrotate )
	upnp? ( net-libs/miniupnpc )
	sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	virtual/bitcoin-leveldb
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

S="${WORKDIR}/${MyP}"

pkg_setup() {
	local UG='litecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/litecoin "${UG}"
}

src_prepare() {
	eautoreconf
}

src_configure() {
	local my_econf=
	if use upnp; then
		my_econf="${my_econf} --with-miniupnpc --enable-upnp-default"
	else
		my_econf="${my_econf} --without-miniupnpc --disable-upnp-default"
	fi
	econf \
		--disable-bench \
		--disable-wallet \
		--disable-ccache \
		--disable-static \
		--disable-tests \
		--with-system-leveldb \
		--with-system-libsecp256k1  \
		--without-libs \
		--without-daemon  \
		--with-utils \
		--without-gui     \
		--without-qrencode \
		${my_econf}
}

src_install() {
	default
}

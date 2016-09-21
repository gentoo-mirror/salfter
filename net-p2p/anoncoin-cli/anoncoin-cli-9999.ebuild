# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

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
IUSE="upnp"

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
	local UG='anoncoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/anoncoin "${UG}"
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
		--with-utils \
		--without-daemon \
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
}

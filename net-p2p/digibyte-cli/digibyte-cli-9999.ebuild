# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="digibyte"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Digibyte client"
HOMEPAGE="https://github.com/digibyte/digibyte"
SRC_URI=""
EGIT_PROJECT='digibyte'
EGIT_REPO_URI="git://github.com/digibyte/digibyte.git https://github.com/digibyte/digibyte.git"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="examples test upnp"

RDEPEND="
	>=dev-libs/boost-1.52.0[threads(+)]
	dev-libs/openssl:0[-bindist]
	upnp? (
		net-libs/miniupnpc
	)
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--disable-ccache \
		$(use_with upnp miniupnpc) $(use_enable upnp upnp-default) \
		$(use_enable test tests)  \
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

	rm "${D}/usr/bin/test_digibyte"

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman doc/man/{digibyte-cli.1,digibyte-tx.1}

}

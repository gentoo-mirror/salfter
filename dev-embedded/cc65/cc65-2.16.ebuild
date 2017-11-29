# $Header: $

EAPI="2"

inherit eutils toolchain-funcs multilib

DESCRIPTION="It's a complete cross development package for 65(C)02 systems."
HOMEPAGE="http://www.cc65.org"
SRC_URI="https://github.com/cc65/${PN}/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( app-text/linuxdoc-tools )"
RDEPEND=""

src_compile() {
	emake
	use doc && emake -C doc 
}

src_install() {
	prefix=/usr DESTDIR=${D} emake install
}

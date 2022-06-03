# $Header: $

EAPI=7

inherit eutils toolchain-funcs multilib

DESCRIPTION="complete cross development package for 65(C)02 systems"
HOMEPAGE="https://cc65.github.io/cc65/"
SRC_URI="https://github.com/cc65/$PN/archive/refs/tags/V$PV.tar.gz -> $P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( app-text/linuxdoc-tools )"
RDEPEND=""

src_compile() {
	emake -j1
	use doc && emake -j1 -C doc 
}

src_install() {
	PREFIX=/usr DESTDIR=${D} emake install
}

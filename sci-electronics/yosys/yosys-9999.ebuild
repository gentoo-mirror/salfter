EAPI=6

inherit git-r3

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
EGIT_REPO_URI="https://github.com/YosysHQ/$PN"
LICENSE=ISC
SLOT=0
KEYWORDS=

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost"

src_compile() {
	emake DESTDIR="$D" PREFIX=/usr
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr install	
}

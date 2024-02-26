EAPI=8

inherit git-r3

# get the current value from the yosys makefile...look for ABCREV
ABC_GIT_COMMIT=bb64142b07794ee685494564471e67365a093710

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
#SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
SRC_URI="https://github.com/YosysHQ/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
EGIT_REPO_URI="https://github.com/YosysHQ/yosys"
EGIT_SUBMODULES=( abc )
LICENSE=ISC
SLOT=0
KEYWORDS=

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost
	sys-devel/clang"

src_unpack() {
	git-r3_fetch $EGIT_REPO_URI 
	git-r3_checkout $EGIT_REPO_URI 
	unpack abc-$ABC_GIT_COMMIT.tar.gz
}

src_prepare() {
	default_src_prepare
	mv $WORKDIR/abc-$ABC_GIT_COMMIT $S/abc
}

src_configure() {
	make config-clang
}

src_compile() {
	make DESTDIR="$D" ABCREV=default ABCPULL=0 PREFIX=/usr
}

src_install() {
	make DESTDIR="$D" ABCREV=default ABCPULL=0 PREFIX=/usr install
}

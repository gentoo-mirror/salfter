EAPI=6

GIT_COMMIT=81c2b92bb419d5b58d47fa8bb8cbb134fb2773bc
S=$WORKDIR/$PN-$GIT_COMMIT

# get the current value from the yosys makefile
ABC_GIT_COMMIT=4f5f73d18b137930fb3048c0b385c82fa078db38

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/YosysHQ/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost
	sys-devel/clang"

src_unpack() {
	unpack $P.tar.gz
	unpack abc-$ABC_GIT_COMMIT.tar.gz
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

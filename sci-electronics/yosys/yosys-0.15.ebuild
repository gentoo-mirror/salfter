EAPI=6

S=$WORKDIR/$PN-$PN-$PV

# get the current value from the yosys makefile...look for ABCREV
ABC_GIT_COMMIT=d7ecb23eeee9c9b4924182ce570c2e33eb18abff

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$P.tar.gz
	 https://github.com/berkeley-abc/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

PATCHES="$FILESDIR/$P-makefile-fix.patch"

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost
	sys-devel/clang"

src_unpack() {
	unpack $P.tar.gz
	unpack abc-$ABC_GIT_COMMIT.tar.gz
	mv $WORKDIR/abc-$ABC_GIT_COMMIT $S/abc
}
src_compile() {
	emake DESTDIR="$D" PREFIX=/usr
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr install	
}

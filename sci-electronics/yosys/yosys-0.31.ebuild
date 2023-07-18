EAPI=8

S=$WORKDIR/$PN-$PN-$PV

# get the current value from the yosys makefile...look for ABCREV
ABC_GIT_COMMIT=bb64142b07794ee685494564471e67365a093710

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$P.tar.gz
	 https://github.com/YosysHQ/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost
	sys-devel/clang"

src_unpack() {
	unpack $P.tar.gz
	unpack abc-$ABC_GIT_COMMIT.tar.gz
	mv $WORKDIR/abc-$ABC_GIT_COMMIT $S/abc
	patch -p0 <$FILESDIR/$P-abc-c++17-fix.patch
}

src_compile() {
	emake DESTDIR="$D" PREFIX=/usr
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr install	
}

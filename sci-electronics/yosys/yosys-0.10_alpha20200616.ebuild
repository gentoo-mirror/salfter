EAPI=6

GIT_COMMIT=c4f20f744be57d4628400368d5fce040a9dbf269
S=$WORKDIR/$PN-$GIT_COMMIT

# get the current value from the yosys makefile
ABC_GIT_COMMIT=fd2c9b1c19216f6b756f88b18f5ca67b759ca128

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/berkeley-abc/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=

PATCHES="$FILESDIR/$PN-0.10-makefile-fix.patch"

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
	emake DESTDIR="$D" ABCPULL=0 PREFIX=/usr
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr install	
}

EAPI=6

GIT_COMMIT=d23acf8c61538aacc9816358f16f0293de5b064d
S=$WORKDIR/$PN-$GIT_COMMIT

ABC_GIT_COMMIT=dc3a544b1f1a6e513cc8ef4588d6181d63b2f2a2

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/berkeley-abc/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=

PATCHES="$FILESDIR/$PN-0.9-makefile-fix.patch"

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

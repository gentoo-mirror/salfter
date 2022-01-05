EAPI=6

GIT_COMMIT=59a71503448401d2476cf0872808e0a99c3a4d81
S=$WORKDIR/$PN-$GIT_COMMIT

# get the current value from the yosys makefile...look for ABCREV
ABC_GIT_COMMIT=f6fa2ddcfc89099726d60386befba874c7ac1e0d

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

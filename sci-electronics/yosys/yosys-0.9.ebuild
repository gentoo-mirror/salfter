EAPI=6

S=$WORKDIR/$PN-$PN-$PV

ABC_GIT_COMMIT=5776ad07e7247993976bffed4802a5737c456782

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$P.tar.gz
	 https://github.com/berkeley-abc/abc/archive/$ABC_GIT_COMMIT.tar.gz -> abc-$ABC_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=~amd64

PATCHES="$FILESDIR/$PN-0.9-makefile-fix.patch"

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost"

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
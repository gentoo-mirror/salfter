EAPI=8

GIT_COMMIT=2bc541743ada3542c6da36a50e66303b9cbd2059
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="reverse-engineered tools for Lattice iCE40 FPGAs"
HOMEPAGE="http://www.clifford.at/icestorm/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-embedded/libftdi
	dev-vcs/git
	dev-vcs/mercurial
	media-gfx/graphviz
	media-gfx/xdot
	dev-qt/qtcore:5
	dev-libs/boost"

src_install() {
	DESTDIR="$D" PREFIX=/usr emake install	
}

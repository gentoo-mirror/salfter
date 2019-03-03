EAPI=6

GIT_COMMIT=15c9bfd75142efd14c37198bc2dce7e428339aa7
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="reverse-engineered tools for Lattice iCE40 FPGAs"
HOMEPAGE="http://www.clifford.at/icestorm/"
SRC_URI="https://github.com/cliffordwolf/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=~amd64

DEPEND="dev-embedded/libftdi
	dev-vcs/git
	dev-vcs/mercurial
	media-gfx/graphviz
	media-gfx/xdot
	dev-qt/qtcore:5
	dev-libs/boost"

src_install() {
	emake DESTDIR="$D" PREFIX=usr install	
}

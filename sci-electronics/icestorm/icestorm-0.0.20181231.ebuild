EAPI=6

GIT_COMMIT=c0cbae88ab47a3879aacf80d53b6a85710682a6b
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="reverse-engineered tools for Lattice iCE40 FPGAs"
HOMEPAGE=""
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

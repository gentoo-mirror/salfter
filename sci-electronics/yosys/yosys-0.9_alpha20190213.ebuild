EAPI=6

GIT_COMMIT=807b3c769733b8cf07f5b14674df41bd2788e09d
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="framework for Verilog RTL synthesis"
HOMEPAGE="http://www.clifford.at/yosys/"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=

DEPEND="dev-vcs/git
	media-gfx/xdot
	dev-libs/boost"

src_compile() {
	emake DESTDIR="$D" PREFIX=/usr
}

src_install() {
	emake DESTDIR="$D" PREFIX=/usr install	
}

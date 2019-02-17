EAPI=6

inherit cmake-utils

GIT_COMMIT=4e0cdfd83e8fd1df94f781f123ad0edde46b42fe
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="experimentation with STEP/IGES visualization in kicad via OCE"
HOMEPAGE="https://github.com/cbernardo/kicad_oce_vis"
SRC_URI="https://github.com/cbernardo/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=GPL-2
SLOT=0
KEYWORDS=~amd64

DEPEND="sci-libs/oce"

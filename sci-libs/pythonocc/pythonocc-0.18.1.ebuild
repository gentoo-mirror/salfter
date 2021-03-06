EAPI=6
PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1 cmake-utils

DESCRIPTION="An industrial strength 3D python package for CAD/BIM/PLM/CAM"
HOMEPAGE="http://www.pythonocc.org/"
SRC_URI="https://github.com/tpaviot/$PN-core/archive/$PV.tar.gz -> $P.tar.gz"
LICENSE=LGPL-3
SLOT=0
KEYWORDS=amd64
S=$WORKDIR/$PN-core-$PV

RDEPEND=">=sci-libs/oce-0.18.1
	>=media-libs/freetype-2.6.3
	>=sci-libs/smesh-6.7.4"
DEPEND="${RDEPEND}
	>=dev-lang/swig-3.0.9"


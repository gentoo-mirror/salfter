EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6})

inherit distutils-r1

MY_PN=Shapely
S=$WORKDIR/$MY_PN-$PV

DESCRIPTION="Manipulation and analysis of geometric objects in the Cartesian plane"
HOMEPAGE="https://pypi.org/project/Shapely/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-$PV.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/numpy"
DEPEND="sci-libs/geos
	dev-python/cython"

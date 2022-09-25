EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

GIT_COMMIT=0a4f539c31a25df52a42bab2ceeffafd45596f73

DESCRIPTION="OpenSCAD for Python"
HOMEPAGE="https://github.com/SolidCode/SolidPython/"
SRC_URI="https://github.com/SolidCode/SolidPython/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
S=$WORKDIR/SolidPython-$GIT_COMMIT

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="( 
	   >=sci-libs/euclid3-0.1.0
	   >=dev-python/pypng-0.0.19
	   dev-python/prettytable
	   >=dev-python/ply-3.11
         )"

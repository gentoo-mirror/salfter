EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3)

inherit distutils-r1

GIT_COMMIT=0a4f539c31a25df52a42bab2ceeffafd45596f73

DESCRIPTION="OpenSCAD for Python"
HOMEPAGE="https://github.com/SolidCode/SolidPython/"
SRC_URI="https://github.com/SolidCode/SolidPython/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
S=$WORKDIR/SolidPython-$GIT_COMMIT
DISTUTILS_USE_SETUPTOOLS=pyproject.toml

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="( 
	   >=sci-libs/euclid3-0.1.0
	   >=dev-python/pypng-0.0.19
	   dev-python/prettytable
	   >=dev-python/ply-3.11
         )"

BDEPEND="(
	   >=dev-python/poetry-core-0.12
	   dev-python/pyproject2setuppy
	 )"

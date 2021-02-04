EAPI=6

PYTHON_COMPAT=( python3_{5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="A parametric CAD scripting framework based on PythonOCC"
HOMEPAGE="https://cadquery.readthedocs.io/"
SRC_URI="https://github.com/CadQuery/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/pythonocc[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]"
DEPEND=""
PATCHES="$FILESDIR/$P-no-tests.patch"


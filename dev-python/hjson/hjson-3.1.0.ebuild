EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 ) 
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="a user interface for JSON"
HOMEPAGE="http://github.com/hjson/hjson-py"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""


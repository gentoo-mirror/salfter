EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 ) 

inherit distutils-r1 pypi

DESCRIPTION="ctypes bindings for hidapi"
HOMEPAGE="https://github.com/apmorton/pyhidapi"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""


EAPI=8
PYTHON_COMPAT=( python3_{8..12} pypy3 ) 

inherit distutils-r1 pypi

DESCRIPTION="Colored symbols for various log levels for Python"
HOMEPAGE="https://github.com/manrajgrover/py-log-symbols"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=">=dev-python/colorama-0.3.9"
DEPEND=""


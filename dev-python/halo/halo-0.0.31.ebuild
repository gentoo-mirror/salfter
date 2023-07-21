EAPI=8
PYTHON_COMPAT=( python3_{8..12} pypy3 ) 

inherit distutils-r1 pypi

DESCRIPTION="Beautiful terminal spinners in Python"
HOMEPAGE="https://github.com/manrajgrover/halo"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=">=dev-python/log-symbols-0.0.14
	 >=dev-python/spinners-0.0.24
	 >=dev-python/termcolor-1.1.0
	 >=dev-python/colorama-0.3.9
	 >=dev-python/six-1.12.0"
DEPEND=""


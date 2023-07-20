EAPI=8
PYTHON_COMPAT=( python3_{8..11} pypy3 )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="an alternative to Universal Charset Encoding Detector"
HOMEPAGE="https://github.com/Ousret/charset_normalizer"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT=0
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""

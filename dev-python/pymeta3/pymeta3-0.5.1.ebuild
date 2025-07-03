EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="a fork of PyMeta 0.5.0 that supports Python 2 and 3"
HOMEPAGE="https://github.com/wbond/pymeta3/"
SRC_URI="https://github.com/wbond/pymeta3/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

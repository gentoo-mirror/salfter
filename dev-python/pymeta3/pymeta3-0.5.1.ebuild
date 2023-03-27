EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3)

inherit distutils-r1

DESCRIPTION="a fork of PyMeta 0.5.0 that supports Python 2 and 3"
HOMEPAGE="https://github.com/wbond/pymeta3/"
SRC_URI="https://github.com/wbond/pymeta3/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

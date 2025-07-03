EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Handlebars.js for Python 3 and 2"
HOMEPAGE="https://github.com/wbond/pybars3/"
SRC_URI="https://github.com/wbond/pybars3/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"

BDEPEND="( >=dev-python/pymeta3-0.5.1 )"

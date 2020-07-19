EAPI=5
PYTHON_COMPAT=(python{2_6,2_7} python3_{4,5,6,7,8,9} pypy pypy3)

inherit distutils-r1

DEPEND=""
RDEPEND=""

MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A least recently used (LRU) cache for Python"
HOMEPAGE="https://github.com/jlhutch/pylru"
LICENSE="GPL-2"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
SLOT="0"
KEYWORDS="~arm64 ~amd64"


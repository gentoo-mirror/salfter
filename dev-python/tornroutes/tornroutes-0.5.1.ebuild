EAPI=6

PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5,6})

inherit distutils-r1

DESCRIPTION="Tornado Web Route Decorator"
HOMEPAGE="https://pypi.org/project/tornroutes/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""

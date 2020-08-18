EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5,6,7})

inherit distutils-r1

DESCRIPTION="Python Data Validation for Humans"
HOMEPAGE="https://pypi.org/project/validators/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/six-1.4.0
	>=dev-python/decorator-3.4.0
"
DEPEND=""

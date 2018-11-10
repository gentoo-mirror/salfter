EAPI=6

PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5,6})

inherit distutils-r1

DESCRIPTION="Python JSON parser for reading JSON objects out of JS files"
HOMEPAGE="https://pypi.org/project/dirtyjson/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT AFL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""

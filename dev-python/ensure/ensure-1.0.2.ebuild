EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10} pypy3)

inherit distutils-r1

DESCRIPTION="Literate BDD assertions in Python with no magic"
HOMEPAGE="https://pypi.python.org/pypi/ensure"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"


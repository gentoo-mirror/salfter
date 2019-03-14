EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3)

inherit distutils-r1

DESCRIPTION="Literate BDD assertions in Python with no magic"
HOMEPAGE="https://pypi.python.org/pypi/ensure"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

#DEPEND="
#	dev-python/setuptools[${PYTHON_USEDEP}]
#"
#RDEPEND=">=dev-python/base58-0.2.1
#	>=dev-python/ecdsa-0.10
#	>=dev-python/six-1.5.2
#	>=dev-python/cachetools-1.1.1"


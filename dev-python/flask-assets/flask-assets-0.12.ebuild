EAPI=5
PYTHON_COMPAT=(python{2_6,2_7,3_{4,5,6,7,8,9}} pypy)

inherit distutils-r1

DEPEND=""
RDEPEND="
	>=dev-python/flask-0.8[${PYTHON_USEDEP}] 
	dev-python/webassets[${PYTHON_USEDEP}]
"

DESCRIPTION="Flask webassets integration"
HOMEPAGE="https://github.com/miracle2k/${PN}"
LICENSE="BSD"
SRC_URI="https://github.com/miracle2k/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~arm64 ~amd64"


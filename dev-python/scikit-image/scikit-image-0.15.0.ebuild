EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6,7} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Image processing in Python"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="http://scikit-image.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/numpy-1.11.0
	>=sci-libs/scipy-0.17.0
	>=dev-python/matplotlib-2.0.0
	<dev-python/matplotlib-3.0.0
	>=dev-python/networkx-2.0
	>=dev-python/pillow-4.3.0
	>=dev-python/imageio-2.0.1
	>=dev-python/pywavelets-0.4.0
"

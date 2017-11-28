EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Better dates & times for Python"
HOMEPAGE="https://pypi.python.org/pypi/arrow"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="examples"

RDEPEND="dev-python/python-dateutil
		 dev-python/simplejson"

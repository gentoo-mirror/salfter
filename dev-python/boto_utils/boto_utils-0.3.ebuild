EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Command-line tools for interacting with Amazon Web Services, based on Boto"
HOMEPAGE="https://pypi.org/project/boto_utils/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/boto-2.2.0
	dev-python/pytz
"
DEPEND=""

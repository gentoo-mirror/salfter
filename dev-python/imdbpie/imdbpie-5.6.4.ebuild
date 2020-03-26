EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5,6})

inherit distutils-r1

DESCRIPTION="Python IMDB client using the IMDB JSON web service made available for their iOS application"
HOMEPAGE="https://pypi.org/project/imdbpie/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-0.10
	<dev-python/requests-3.0.0
	>=dev-python/six-1.0.0
	<dev-python/six-2.0.0
	>=dev-python/boto-2.48.0
	>=dev-python/python-dateutil-2.6.1
	<dev-python/python-dateutil-3.0.0
	>=dev-python/diskcache-2.9.0
	<dev-python/diskcache-3.0.0
	>=dev-python/attrs-18.1.0
	>=dev-python/trans-2.1.0
	<dev-python/trans-3.0.0
"
#	>=dev-python/wheel-0.30.0
#	>=dev-python/setuptools-39.0.1
#	<dev-python/attrs-19.0.0

DEPEND=""

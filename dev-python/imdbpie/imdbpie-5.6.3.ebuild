EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5,6})

inherit distutils-r1

DESCRIPTION="Python IMDB client using the IMDB JSON web service made available for their iOS application"
HOMEPAGE="https://pypi.org/project/imdbpie/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""

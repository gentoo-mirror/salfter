EAPI=6

PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5,6,7})

inherit distutils-r1

DESCRIPTION="translates national characters into similar sounding latin characters (transliteration)"
HOMEPAGE="https://pypi.org/project/trans/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""

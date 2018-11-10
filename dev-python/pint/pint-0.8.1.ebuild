EAPI=6

PYTHON_COMPAT=( python2_{6,7} python3_{3,4,5,6})

inherit distutils-r1

DESCRIPTION="makes units easy"
HOMEPAGE="https://pypi.org/project/pint/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/Pint-${PV}.tar.gz -> ${P}.tar.gz"
S=$WORKDIR/Pint-$PV

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
DEPEND=""

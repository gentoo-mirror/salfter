EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="A wrapper for The Movie Database API v3"
HOMEPAGE="https://github.com/celiao/"
SRC_URI="https://github.com/celiao/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


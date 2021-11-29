EAPI=7

PYTHON_COMPAT=( python3_{7,8,9,10} pypy3)

inherit distutils-r1

DESCRIPTION="pick an option in the terminal with a simple GUI"
HOMEPAGE="https://github.com/wong2/pick"
SRC_URI="https://github.com/wong2/$PN/archive/v$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..12})

inherit distutils-r1

DESCRIPTION="pick an option in the terminal with a simple GUI"
HOMEPAGE="https://github.com/wong2/pick"
SRC_URI="https://github.com/wong2/$PN/archive/v$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

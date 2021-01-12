EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="A simple way to ping in Python"
HOMEPAGE="https://github.com/alessandromaggio/pythonping"
SRC_URI="https://github.com/alessandromaggio/$PN/archive/v$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

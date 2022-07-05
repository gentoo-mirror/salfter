EAPI=7
PYTHON_COMPAT=( python3_{7,8,9,10,11} )

inherit distutils-r1

DESCRIPTION="SHA-3 wrapper for Python"
HOMEPAGE="https://github.com/tiran/pysha3"
SRC_URI="https://github.com/tiran/$PN/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"
#S=$WORKDIR/python-$P

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64"


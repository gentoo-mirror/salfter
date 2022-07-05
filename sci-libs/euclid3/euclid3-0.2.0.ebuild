EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3)

inherit distutils-r1

DESCRIPTION="vector, matrix, quaternion and some geometry in 2D and 3D for Python 3"
HOMEPAGE="https://github.com/euclid3/euclid3/"
SRC_URI="https://github.com/euclid3/euclid3/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64"


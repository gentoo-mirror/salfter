EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit distutils-r1

DESCRIPTION="writes Value Change Dump (VCD) files as specified in IEEE 1364-2005"
HOMEPAGE="https://github.com/westerndigitalcorporation/pyvcd"
SRC_URI="https://github.com/westerndigitalcorporation/$PN/releases/download/$PV/$P.tar.gz"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""


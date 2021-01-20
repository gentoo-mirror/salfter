EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Get MAC addresses of remote hosts and local interfaces"
HOMEPAGE="https://github.com/GhostofGoes/getmac"
SRC_URI="https://github.com/GhostofGoes/$PN/releases/download/$PV/$P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

EAPI=8
PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3 ) 

inherit distutils-r1

MY_PN="trezor"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Client side implementation for TREZOR-compatible Bitcoin hardware wallets"
HOMEPAGE="https://github.com/trezor/python-trezor"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="dev-python/protobuf-python"


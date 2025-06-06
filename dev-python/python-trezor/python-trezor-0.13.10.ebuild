EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 ) 
PYPI_PN=trezor

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

MY_PN="trezor"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Client side implementation for TREZOR-compatible Bitcoin hardware wallets"
HOMEPAGE="https://github.com/trezor/python-firmware"
S="${WORKDIR}/${MY_P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="dev-python/protobuf-python"


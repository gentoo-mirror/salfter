EAPI=8
PYTHON_COMPAT=( python3_{8..11} pypy3 ) 
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="CLI for the Linode API"
HOMEPAGE="https://github.com/linode/linode-cli"
DISTUTILS_USE_PEP517=setuptools

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""


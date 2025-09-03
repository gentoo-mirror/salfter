EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 git-r3

DESCRIPTION="documentation and tools for the Gowin FPGA bitstream format"
HOMEPAGE="https://github.com/YosysHQ/apicula"
EGIT_REPO_URI=$HOMEPAGE
EGIT_COMMIT=$PV

DEPEND="dev-python/numpy
	dev-python/pandas
	dev-python/pillow
	dev-python/crcmod
	dev-python/openpyxl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

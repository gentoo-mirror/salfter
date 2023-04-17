EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3)

inherit distutils-r1

S=$WORKDIR/Apycula-$PV

DESCRIPTION="documentation and tools for the Gowin FPGA bitstream format"
HOMEPAGE="https://github.com/YosysHQ/apicula"
SRC_URI="mirror://pypi/A/Apycula/Apycula-$PV.tar.gz -> $P.tar.gz"
DISTUTILS_USE_PEP517=setuptools

DEPEND="dev-python/numpy
	dev-python/pandas
	dev-python/pillow
	dev-python/crcmod
	dev-python/openpyxl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10} pypy3)

inherit distutils-r1

S=$WORKDIR/Apycula-$PV

DESCRIPTION="documentation and tools for the Gowin FPGA bitstream format"
HOMEPAGE="https://github.com/YosysHQ/apicula"
SRC_URI="https://files.pythonhosted.org/packages/5d/fd/0f5e342aa4310423292b374f247bc37dd09006aaa36f68c2fe6f939a0952/Apycula-0.2.tar.gz -> $P.tar.gz"

DEPEND="dev-python/numpy
	dev-python/pandas
	dev-python/pillow
	dev-python/crcmod
	dev-python/openpyxl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

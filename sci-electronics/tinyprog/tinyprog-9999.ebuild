EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="Programmer for FPGA boards using the TinyFPGA USB Bootloader"
HOMEPAGE="https://github.com/tinyfpga/TinyFPGA-Bootloader/"
EGIT_REPO_URI="https://github.com/tinyfpga/TinyFPGA-Bootloader"
S=$WORKDIR/$P/programmer

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND=">=dev-python/pyserial-3
	 <dev-python/pyserial-4
	 >=dev-python/jsonmerge-1.4
	 <dev-python/jsonmerge-2
	 >=dev-python/intelhex-2.2.1
	 <dev-python/intelhex-3
	 >=dev-python/tqdm-4.19.5
	 <dev-python/tqdm-5
	 dev-python/six
	 dev-python/packaging
	 dev-python/pyusb"
DEPEND="" # "dev-python/setuptools_scm"

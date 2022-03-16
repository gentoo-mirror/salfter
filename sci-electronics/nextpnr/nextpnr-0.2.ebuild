EAPI=8

DESCRIPTION="portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI=""
LICENSE=metapackage
SLOT=0
KEYWORDS="amd64"
IUSE="ice40 ecp5"

RDEPEND="ice40? ( >=sci-electronics/nextpnr-ice40-$PV ) 
	 ecp5?  ( >=sci-electronics/nextpnr-ecp5-$PV )"

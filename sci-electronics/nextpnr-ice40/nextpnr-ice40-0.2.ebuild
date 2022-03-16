EAPI=8

inherit cmake

S=$WORKDIR/nextpnr-nextpnr-$PV

DESCRIPTION="portable FPGA place and route tool (iCE40 build)"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI="https://github.com/YosysHQ/nextpnr/archive/nextpnr-$PV.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64
IUSE="gui"

DEPEND="sci-electronics/icestorm 
	>=sci-electronics/yosys-0.8 
	gui? ( dev-qt/qtcore:5 
               virtual/opengl )
	dev-libs/boost
	dev-cpp/eigen"

src_unpack() {
	unpack nextpnr-$PV.tar.gz
	rmdir $S/3rdparty/fpga-interchange-schema # $S/3rdparty/abseil-cpp
}

src_configure() {
	local mycmakeargs=(
		-DARCH=ice40
		-DICESTORM_INSTALL_PREFIX=/usr 
		$(usex gui -DBUILD_GUI=ON "")
	)
	cmake_src_configure
}

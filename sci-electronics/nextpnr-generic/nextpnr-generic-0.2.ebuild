EAPI=8

inherit cmake

S=$WORKDIR/nextpnr-nextpnr-$PV

DESCRIPTION="portable FPGA place and route tool (generic build)"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI="https://github.com/YosysHQ/nextpnr/archive/nextpnr-$PV.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64
IUSE="gui"

DEPEND="gui? ( dev-qt/qtcore:5 
               virtual/opengl )
	dev-libs/boost
	dev-cpp/eigen
	!<sci-electronics/nextpnr-0.2"

src_unpack() {
	unpack nextpnr-$PV.tar.gz
	rmdir $S/3rdparty/fpga-interchange-schema # $S/3rdparty/abseil-cpp
}

src_configure() {
	local mycmakeargs=(
		-DARCH=generic
		$(usex gui -DBUILD_GUI=ON "")
	)
	cmake_src_configure
}

EAPI=8

inherit cmake

S=$WORKDIR/nextpnr-$P

DESCRIPTION="portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI="https://github.com/YosysHQ/nextpnr/archive/$P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS="amd64"
IUSE="ice40 ecp5 machxo2 gui"

DEPEND="ice40? ( sci-electronics/icestorm )
	ecp5? ( sci-electronics/prjtrellis )
	machxo2? ( sci-electronics/prjtrellis )
	>=sci-electronics/yosys-0.8 
	gui? ( dev-qt/qtcore:5 
               virtual/opengl )
	dev-libs/boost
	dev-cpp/eigen"

src_unpack() {
	unpack $P.tar.gz
	rmdir $S/3rdparty/fpga-interchange-schema # $S/3rdparty/abseil-cpp
}

src_configure() {
	local mycmakeargs=(
		-DARCH=generic$(usex ice40 ";ice40" "")$(usex ecp5 ";ecp5" "")$(usex machxo2 ";machxo2" "")
		$(usex ice40 "-DICESTORM_INSTALL_PREFIX=/usr" "") 
		$(usex ecp5 "-DTRELLIS_INSTALL_PREFIX=/usr" "")
		$(usex machxo2 "-DTRELLIS_INSTALL_PREFIX=/usr" "")
		$(usex gui -DBUILD_GUI=ON "")
	)
	cmake_src_configure
}



EAPI=7

inherit cmake-utils

GIT_COMMIT=cc367d7e678f42f44ab029f2f3c372e4a09ed19d
S=$WORKDIR/$PN-$GIT_COMMIT

ABSEIL_CPP_GIT_COMMIT=a76698790753d2ec71f655cdc84d61bcb27780d4
FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT=bce42208b80c239d749881603b4cdf41944c70ad

DESCRIPTION="portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/abseil/abseil-cpp/archive/$ABSEIL_CPP_GIT_COMMIT.tar.gz -> abseil-cpp-$ABSEIL_CPP_GIT_COMMIT.tar.gz
	 https://github.com/SymbiFlow/fpga-interchange-schema/archive/$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT.tar.gz -> fpga-interchange-schema-$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64
IUSE="ice40 ecp5"

DEPEND="ice40? ( sci-electronics/icestorm 
	         >=sci-electronics/yosys-0.8 )
	ecp5? ( sci-electronics/prjtrellis 
	        >sci-electronics/yosys-0.8 )
	dev-qt/qtcore:5
	dev-libs/boost
	dev-cpp/eigen"

src_unpack() {
	unpack $P.tar.gz
	rmdir $S/3rdparty/abseil-cpp $S/3rdparty/fpga-interchange-schema
	unpack abseil-cpp-$ABSEIL_CPP_GIT_COMMIT.tar.gz
	mv $WORKDIR/abseil-cpp-$ABSEIL_CPP_GIT_COMMIT $S/3rdparty/abseil-cpp
	unpack fpga-interchange-schema-$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT.tar.gz
	mv $WORKDIR/fpga-interchange-schema-$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT $S/3rdparty/fpga-interchange-schema
}

src_configure() {
	local mycmakeargs=(
		$(usex ice40 $(usex ecp5 "-DARCH=all" "-DARCH=ice40") $(usex ecp5 "-DARCH=ecp5" "-DARCH=generic"))
		$(usex ice40 -DICEBOX_ROOT=/usr/share/icebox "")
		$(usex ecp5 -DTRELLIS_ROOT=/usr/share/trellis "")
	)
	cmake-utils_src_configure
}


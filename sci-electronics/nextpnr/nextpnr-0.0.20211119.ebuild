EAPI=7

inherit cmake-utils

GIT_COMMIT=f5cc959c4efdc4e6922bc0a7bcbc9eb38c37248e
S=$WORKDIR/$PN-$GIT_COMMIT

#ABSEIL_CPP_GIT_COMMIT=a76698790753d2ec71f655cdc84d61bcb27780d4
#FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT=6b2973788692be86c4a8b2cff1353e603e5857a3

DESCRIPTION="portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
#	 https://github.com/SymbiFlow/fpga-interchange-schema/archive/$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT.tar.gz -> fpga-interchange-schema-$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT.tar.gz"
#	 https://github.com/abseil/abseil-cpp/archive/$ABSEIL_CPP_GIT_COMMIT.tar.gz -> abseil-cpp-$ABSEIL_CPP_GIT_COMMIT.tar.gz
LICENSE=ISC
SLOT=0
KEYWORDS=amd64
IUSE="ice40 ecp5 gui"

DEPEND="ice40? ( sci-electronics/icestorm 
	         >=sci-electronics/yosys-0.8 )
	ecp5? ( sci-electronics/prjtrellis 
	        >sci-electronics/yosys-0.8 )
	gui? ( dev-qt/qtcore:5 
               virtual/opengl )
	dev-libs/boost
	dev-cpp/eigen"

src_unpack() {
	unpack $P.tar.gz
	rmdir $S/3rdparty/fpga-interchange-schema # $S/3rdparty/abseil-cpp
#	unpack abseil-cpp-$ABSEIL_CPP_GIT_COMMIT.tar.gz
#	mv $WORKDIR/abseil-cpp-$ABSEIL_CPP_GIT_COMMIT $S/3rdparty/abseil-cpp
#	unpack fpga-interchange-schema-$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT.tar.gz
#	mv $WORKDIR/fpga-interchange-schema-$FPGA_INTERCHANGE_SCHEMA_GIT_COMMIT $S/3rdparty/fpga-interchange-schema
}

src_configure() {
	local mycmakeargs=(
		$(usex ice40 $(usex ecp5 "-DARCH=all" "-DARCH=ice40") $(usex ecp5 "-DARCH=ecp5" "-DARCH=generic"))
		$(usex ice40 -DICEBOX_ROOT=/usr/share/icebox "")
		$(usex ecp5 -DTRELLIS_ROOT=/usr/share/trellis "")
		$(usex gui -DBUILD_GUI=ON "")
	)
	cmake-utils_src_configure
}


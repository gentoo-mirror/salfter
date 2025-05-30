EAPI=8

inherit cmake git-r3

DESCRIPTION="portable FPGA place and route tool"
HOMEPAGE="https://github.com/YosysHQ/nextpnr"
EGIT_REPO_URI="https://github.com/YosysHQ/nextpnr/"
EGIT_COMMIT=$PN-$PV
LICENSE=ISC
SLOT=0
KEYWORDS="amd64"
IUSE="ice40 ecp5 machxo2 nexus gowin gui"

DEPEND="ice40? ( sci-electronics/icestorm )
	ecp5? ( sci-electronics/prjtrellis )
	machxo2? ( sci-electronics/prjtrellis )
	nexus? ( sci-electronics/prjoxide )
	gowin? ( sci-electronics/apicula )
	>=sci-electronics/yosys-0.8 
	gui? ( dev-qt/qtcore:5 
               virtual/opengl )
	dev-libs/boost
	dev-cpp/eigen"

src_configure() {
	local mycmakeargs=(
		-DARCH=generic$(usex ice40 ";ice40" "")$(usex ecp5 ";ecp5" "")$(usex machxo2 ";machxo2" "")$(usex nexus ";nexus" "")$(usex gowin ";gowin" "")
		$(usex ice40 "-DICESTORM_INSTALL_PREFIX=/usr" "") 
		$(usex ecp5 "-DTRELLIS_INSTALL_PREFIX=/usr" "")
		$(usex machxo2 "-DTRELLIS_INSTALL_PREFIX=/usr" "")
		$(usex nexus "-DOXIDE_INSTALL_PREFIX=/usr" "")
		$(usex gui -DBUILD_GUI=ON "")
	)
	cmake_src_configure
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="open Multiple View Geometry library. Basis for 3D computer vision and Structure from Motion."
HOMEPAGE="https://github.com/openMVG/openMVG"
EGIT_REPO_URI="https://github.com/openMVG/openMVG.git"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+opencv +openmp"

RDEPEND="opencv? ( >=media-libs/opencv-3 )
         >=dev-cpp/eigen-3.3.4
	 sci-libs/ceres-solver
	 sci-libs/flann
	 app-arch/lz4"

DEPEND="${RDEPEND}"
S=${S}/src

CMAKE_BUILD_TYPE=Release

src_prepare() {

	
	cmake-utils_src_prepare
	epatch ${FILESDIR}/${PN}-link-fix.patch
}

src_configure() {
	local mycmakeargs=(
		-DOpenMVG_USE_OPENCV="$(usex opencv)"
		-DOpenMVG_USE_OPENMP="$(usex openmp)"
		-DCMAKE_BUILD_TYPE="Release"
		-DFLANN_INCLUDE_DIR_HINTS=/usr/include
	)
	cmake-utils_src_configure
	cd ${WORKDIR}/${P}
	cp src/software/SfMWebGLViewer/config.h.in src/software/SfMWebGLViewer/config.h
}

src_install() {
	cmake-utils_src_install
}

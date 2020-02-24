EAPI=6

inherit cmake-utils

DESCRIPTION="photogrammetric computer vision framework"
HOMEPAGE="http://alicevision.github.io/"

NANOFLANN_GIT_COMMIT=cc77e17934441dc82b33fd00e0a8a1398f24c928
OSI_CLP_GIT_COMMIT=38ab28d1c5a53de13c8684cdc272b1deb8cef459
MESHSDFILTER_GIT_COMMIT=b7dfeed64be90f2eff49345cf65451b700d3a417

SRC_URI="https://github.com/alicevision/AliceVision/archive/v$PV.tar.gz -> $P.tar.gz
	 https://github.com/alicevision/nanoflann/archive/$NANOFLANN_GIT_COMMIT.tar.gz -> nanoflann-$NANOFLANN_GIT_COMMIT.tar.gz
	 https://github.com/alicevision/osi_clp/archive/$OSI_CLP_GIT_COMMIT.tar.gz -> osi_clp-$OSI_CLP_GIT_COMMIT.tar.gz
	 https://github.com/alicevision/MeshSDFilter/archive/$MESHSDFILTER_GIT_COMMIT.tar.gz -> meshsdfilter-$MESHSDFILTER_GIT_COMMIT.tar.gz"
LICENSE=MPL-2.0
SLOT=0
KEYWORDS=~amd64
S=$WORKDIR/AliceVision-$PV

PATCHES=$FILESDIR/$P-boost-ambiguity-fix.patch

CMAKE_BUILD_TYPE=Release

IUSE="cuda alembic openmp" # cctag popsift uncertaintyte opengv 

# ebuilds to implement for optional support:
# https://github.com/alicevision/CCTag
# https://github.com/alicevision/uncertaintyTE
# https://github.com/laurentkneip/opengv
# https://github.com/alicevision/popsift

DEPEND=">=dev-libs/boost-1.60.0
	>=dev-cpp/eigen-3.3.4
	>=sci-libs/ceres-solver-1.10.0[sparse,lapack]
	!sci-libs/flann
	>=media-libs/openexr-2.2.0
	>=media-libs/openimageio-1.8.7
	cuda? ( >=dev-util/nvidia-cuda-sdk-10.0 <sys-devel/gcc-9 )
	sys-libs/zlib
	alembic? ( media-gfx/alembic )
	openmp? ( sys-devel/gcc[openmp] )
	>=sci-libs/geogram-1.5.4"

src_configure()
{
  local mycmakeargs=(
    -DOPENEXR_INCLUDE_PATH=/usr/include/x86_64-pc-linux-gnu/OpenEXR
    -DALICEVISION_BUILD_DOC=OFF
    -DALICEVISION_BUILD_EXAMPLES=OFF
  )
  use cuda || mycmakeargs+=( -DALICEVISION_USE_CUDA=OFF )
  cmake-utils_src_configure
}

src_unpack() {
	unpack $P.tar.gz
	cd $S
	unpack nanoflann-$NANOFLANN_GIT_COMMIT.tar.gz
	rmdir src/dependencies/nanoflann
	mv nanoflann-$NANOFLANN_GIT_COMMIT src/dependencies/nanoflann
	unpack osi_clp-$OSI_CLP_GIT_COMMIT.tar.gz
	rmdir src/dependencies/osi_clp
	mv osi_clp-$OSI_CLP_GIT_COMMIT src/dependencies/osi_clp
	unpack meshsdfilter-$MESHSDFILTER_GIT_COMMIT.tar.gz
	rmdir src/dependencies/MeshSDFilter
	mv MeshSDFilter-$MESHSDFILTER_GIT_COMMIT src/dependencies/MeshSDFilter
}
	
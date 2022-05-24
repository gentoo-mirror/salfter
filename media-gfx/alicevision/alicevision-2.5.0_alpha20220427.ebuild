EAPI=7

inherit cmake-utils

DESCRIPTION="photogrammetric computer vision framework"
HOMEPAGE="http://alicevision.github.io/"

GIT_COMMIT=156c6321d58ce290ef98ee9630c92111fc6f4313

NANOFLANN_GIT_COMMIT=cc77e17934441dc82b33fd00e0a8a1398f24c928
OSI_CLP_GIT_COMMIT=38ab28d1c5a53de13c8684cdc272b1deb8cef459
MESHSDFILTER_GIT_COMMIT=b7dfeed64be90f2eff49345cf65451b700d3a417

SRC_URI="https://github.com/alicevision/AliceVision/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/alicevision/nanoflann/archive/$NANOFLANN_GIT_COMMIT.tar.gz -> nanoflann-$NANOFLANN_GIT_COMMIT.tar.gz
	 https://github.com/alicevision/osi_clp/archive/$OSI_CLP_GIT_COMMIT.tar.gz -> osi_clp-$OSI_CLP_GIT_COMMIT.tar.gz
	 https://github.com/alicevision/MeshSDFilter/archive/$MESHSDFILTER_GIT_COMMIT.tar.gz -> meshsdfilter-$MESHSDFILTER_GIT_COMMIT.tar.gz"

LICENSE=MPL-2.0
SLOT=0
KEYWORDS=~amd64
S=$WORKDIR/AliceVision-$GIT_COMMIT

CMAKE_BUILD_TYPE=Release

IUSE="cuda alembic openmp opencv" # cctag popsift uncertaintyte opengv 

# ebuilds to implement for optional support:
# https://github.com/alicevision/CCTag
# https://github.com/alicevision/uncertaintyTE
# https://github.com/laurentkneip/opengv
# https://github.com/alicevision/popsift

DEPEND=">=dev-libs/boost-1.70.0
        >=media-libs/assimp-5.0.0
	>=sci-libs/ceres-solver-1.10.0[sparse,lapack]
	>=dev-cpp/eigen-3.3.4
	>=sci-libs/geogram-1.7.5
	>=media-libs/openexr-2.5
	opencv? ( >=media-libs/openimageio-2.1.0[opencv] )
	!opencv? ( >=media-libs/openimageio-2.1.0 )
	sys-libs/zlib
	cuda? ( >=dev-util/nvidia-cuda-toolkit-11.6 )
	openmp? ( sys-devel/gcc[openmp] )
	alembic? ( media-gfx/alembic )"

src_configure()
{
  local mycmakeargs=(
    -DALICEVISION_BUILD_DOC=OFF
    -DALICEVISION_BUILD_EXAMPLES=OFF
  )
  use cuda || mycmakeargs+=( -DALICEVISION_USE_CUDA=OFF )
  use opencv && mycmakeargs+=( -DALICEVISION_USE_OPENCV=ON )
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
	
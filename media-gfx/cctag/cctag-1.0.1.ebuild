EAPI=7

inherit cmake-utils

DESCRIPTION="Detection of CCTag markers made up of concentric circles"
HOMEPAGE="https://cctag.readthedocs.io/"

SRC_URI="https://github.com/alicevision/CCTag/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"

LICENSE=MPL-2.0
SLOT=0
KEYWORDS=~amd64

S=$WORKDIR/CCTag-$PV

IUSE="cuda cpu_flags_x86_avx2"

DEPEND=">=dev-cpp/eigen-3.3.4
        >=dev-libs/boost-1.66
        >=media-libs/opencv-3.1
        >=dev-cpp/tbb-4.0
	cuda? ( >=dev-util/nvidia-cuda-sdk-11 )"

PATCHES=( $FILESDIR/1840f4224ef6f2ba78aaa2cd0b311d0a5bbd6710.patch )

src_configure()
{
  local mycmakeargs=( )
  use cuda || mycmakeargs+=( -DCCTAG_WITH_CUDA=OFF )
  use cpu_flags_x86_avx2 && mycmakeargs+=( -DCCTAG_ENABLE_SIMD_AVX2=ON )
  cmake-utils_src_configure
}

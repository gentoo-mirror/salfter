EAPI=6

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 #cmake-utils

DESCRIPTION="GPU-accelerated photogrammetry"
HOMEPAGE="http://alicevision.github.io/"
SRC_URI="https://github.com/alicevision/meshroom/archive/v$PV.tar.gz -> $P.tar.gz"
LICENSE=MPL-2.0
SLOT=0
KEYWORDS=~amd64

RDEPEND=">=dev-python/psutil-5.6.3
	 >=dev-python/pyside2-5.13.0[3d,quick]
	 >=dev-python/markdown-2.6.11
	 >=dev-python/requests-2.22.0
	 >=media-gfx/alicevision-2.2.0[alembic]
	 >=dev-qt/qtoiio-2019.2.0
	 dev-python/enum34
	 dev-python/cx_Freeze"

#src_configure()
#{
#  local mycmakeargs=(
#    -DMR_BUILD_QTOIIO=OFF
#    -DMR_BUILD_QMLALEMBIC=OFF
#    -DMR_BUILD_QTALICEVISION=OFF
#  )
#  cmake-utils_src_configure
#}

#src_install()
#{
#  cd $S && python setup.py install
#}

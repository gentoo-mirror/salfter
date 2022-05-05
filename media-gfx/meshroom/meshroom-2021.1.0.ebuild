EAPI=8 

PYTHON_COMPAT=( python3_{6,7,8,9,10} )

inherit distutils-r1

DESCRIPTION="GPU-accelerated photogrammetry"
HOMEPAGE="http://alicevision.github.io/"
SRC_URI="https://github.com/alicevision/meshroom/archive/v$PV.tar.gz -> $P.tar.gz"
LICENSE=MPL-2.0
SLOT=0
KEYWORDS=~amd64

RDEPEND=">=dev-python/psutil-5.6.3
	 >=dev-python/pyside2-5.14.1[3d,quick]
	 >=dev-python/markdown-2.6.11
	 >=dev-python/requests-2.22.0
	 >=media-gfx/alicevision-2.4.0[alembic]
	 dev-python/cx_Freeze"

src_prepare()
{
  default
  rm -r $S/docker
}


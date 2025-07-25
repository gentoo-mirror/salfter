EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Automation for KiCad"
HOMEPAGE="https://github.com/yaqwsx/KiKit/"
SRC_URI="https://github.com/yaqwsx/KiKit/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/KiKit-$PV

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="(
	   >=sci-electronics/pcbnewTransition-0.3.4-r1
	   >=dev-python/shapely-1.7
           >=dev-python/click-7.1
           >=dev-python/markdown2-2.4
	   >=dev-python/pybars3-0.9
	   sci-libs/solidpython2-legacy
	   !sci-libs/solidpython
	   >=dev-python/commentjson-0.9
	   media-gfx/openscad
	   sci-electronics/kicad
	 )"

distutils_enable_tests unittest

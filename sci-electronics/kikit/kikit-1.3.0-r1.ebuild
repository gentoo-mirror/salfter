EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} )

inherit distutils-r1

DESCRIPTION="Automation for KiCad"
HOMEPAGE="https://github.com/yaqwsx/KiKit/"
SRC_URI="https://github.com/yaqwsx/KiKit/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/KiKit-$PV
DISTUTILS_USE_PEP517=setuptools
PATCHES="$FILESDIR/$P-solidpython2.patch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="(
	   >=sci-electronics/pcbnewTransition-0.2.0
	   >=dev-python/shapely-1.7
           >=dev-python/click-7.1
           >=dev-python/markdown2-2.4
	   >=dev-python/pybars3-0.9
	   sci-libs/solidpython2-legacy
	   !sci-libs/solidpython
	   >=dev-python/commentjson-0.9
	   media-gfx/openscad
	 )"

distutils_enable_tests unittest
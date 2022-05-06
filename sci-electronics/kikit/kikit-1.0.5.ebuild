EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10} )

inherit distutils-r1

DESCRIPTION="Automation for KiCad"
HOMEPAGE="https://github.com/yaqwsx/KiKit/"
SRC_URI="https://github.com/yaqwsx/KiKit/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/KiKit-$PV

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

PATCHES="$FILESDIR/$P-setup.patch"

RDEPEND="(
	   >=sci-electronics/pcbnewTransition-0.2.0
	   >=dev-python/numpy-1.21
	   >=sci-libs/shapely-1.7
           >=dev-python/click-7.1
           >=dev-python/markdown2-2.4
	   >=dev-python/pybars3-0.9
	   >=sci-libs/solidpython-1.1.2
	   >=dev-python/commentjson-0.9
	 )"


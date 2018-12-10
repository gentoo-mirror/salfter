EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Know better your media files"
HOMEPAGE="https://pypi.org/project/knowit/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/babelfish-0.5.2
	>=dev-python/enzyme-0.4.1
	>=dev-python/pint-0.8
	>=dev-python/pymediainfo-2.1.5
	dev-python/pyyaml
	>=dev-python/six-1.9.0
"
DEPEND=""
PATCHES=( $FILESDIR/$PN-ffmpeg-priority.patch )

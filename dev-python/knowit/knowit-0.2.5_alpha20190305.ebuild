EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6})

GIT_COMMIT=eea9ac18e38c930230cf81b5dca4a9af9fb10d4e
S=${WORKDIR}/${PN}-${GIT_COMMIT}

inherit distutils-r1

DESCRIPTION="Know better your media files"
HOMEPAGE="https://github.com/ratoaq2/knowit/"
SRC_URI="https://github.com/ratoaq2/${PN}/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

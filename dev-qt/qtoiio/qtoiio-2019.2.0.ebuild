EAPI=6

inherit cmake-utils

DESCRIPTION="Qt Image IO plugin based on OpenImageIO"
HOMEPAGE="http://www.openimageio.org/"

SRC_URI="https://github.com/alicevision/QtOIIO/archive/v$PV.tar.gz -> $P.tar.gz"
LICENSE=MPL-2.0
SLOT=0
KEYWORDS=~amd64
S=$WORKDIR/QtOIIO-$PV

PATCHES=$FILESDIR/$PN-cmake-fix.patch

CMAKE_BUILD_TYPE=Release

DEPEND="sys-libs/zlib
	media-libs/openexr
	media-libs/openimageio
	dev-qt/qtcore"


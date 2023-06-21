EAPI=8

inherit cmake

GIT_COMMIT=9da543e8329fdd81b64eb48742d8ccb09377aed1

DESCRIPTION="a simple stupid single-header-file SVG parser"
HOMEPAGE="https://github.com/memononen/nanosvg"
SRC_URI="https://github.com/memononen/$PN/archive/${GIT_COMMIT}.tar.gz"

S=$WORKDIR/$PN-$GIT_COMMIT

LICENSE=ZLIB
SLOT=0
KEYWORDS=~amd64

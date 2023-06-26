EAPI=8

inherit cmake

GIT_COMMIT=abcd277ea45e9098bed752cf9c6875b533c0892f

DESCRIPTION="a simple stupid single-header-file SVG parser"
HOMEPAGE="https://github.com/fltk/nanosvg"
SRC_URI="https://github.com/fltk/$PN/archive/${GIT_COMMIT}.tar.gz"

S=$WORKDIR/$PN-$GIT_COMMIT

LICENSE=ZLIB
SLOT=0
KEYWORDS=~amd64

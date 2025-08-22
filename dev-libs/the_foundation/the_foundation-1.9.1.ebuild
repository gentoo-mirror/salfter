EAPI=8

inherit cmake

DESCRIPTION="an object-oriented C library whose API is designed for a particular coding style, taking cues from C++ STL and Qt"
HOMEPAGE="https://git.skyjake.fi/skyjake/the_Foundation"
SRC_URI="https://git.skyjake.fi/skyjake/the_Foundation/archive/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

EAPI=7

inherit cmake-utils

DESCRIPTION="desktop GUI client for browsing Geminispace"
HOMEPAGE="https://gmi.skyjake.fi/lagrange/"
SRC_URI="https://github.com/skyjake/$PN/releases/download/v$PV/$P.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"
RDEPEND="media-libs/libsdl2
	 dev-libs/openssl
	 dev-libs/libpcre
	 sys-libs/zlib
	 dev-libs/libunistring
	 >=dev-libs/fribidi-1.0.10
	 >=media-libs/harfbuzz-2.8.2
	 >=dev-libs/the_foundation-1.4
	 media-libs/libsdl2
	 media-sound/mpg123
	 media-libs/libwebp"


src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	rm -r $S/lib/fribidi $S/lib/harfbuzz $S/lib/the_Foundation
}

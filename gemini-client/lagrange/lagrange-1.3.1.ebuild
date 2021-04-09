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
	 dev-libs/libunistring"

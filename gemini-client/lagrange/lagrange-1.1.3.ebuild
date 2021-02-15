EAPI=7

inherit cmake-utils

THEFOUNDATION_COMMIT=01f8bfef11c78aad59ae300ddc1bb9de8ce809b8

DESCRIPTION="desktop GUI client for browsing Geminispace"
HOMEPAGE="https://gmi.skyjake.fi/lagrange/"
SRC_URI="https://github.com/skyjake/$PN/releases/download/v$PV/$P.tar.gz
	 https://git.skyjake.fi/skyjake/the_Foundation/archive/$THEFOUNDATION_COMMIT.tar.gz -> theFoundation-$THEFOUNDATION_COMMIT.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"
RDEPEND="media-libs/libsdl2
	 dev-libs/openssl
	 dev-libs/libpcre
	 sys-libs/zlib
	 dev-libs/libunistring"

src_unpack() {
	unpack $P.tar.gz
	unpack theFoundation-$THEFOUNDATION_COMMIT.tar.gz
	mv $WORKDIR/the_foundation $S/lib/the_Foundation
}

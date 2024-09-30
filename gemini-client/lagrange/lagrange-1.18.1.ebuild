EAPI=8

inherit cmake

DESCRIPTION="desktop GUI (and optional TUI) client for browsing Geminispace"
HOMEPAGE="https://gmi.skyjake.fi/lagrange/"
SRC_URI="https://github.com/skyjake/$PN/releases/download/v$PV/$P.tar.gz"
#IUSE="tui"

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
# 	 tui? ( dev-libs/sealcurses )


src_configure() {
	local mycmakeargs=(
		-DENABLE_FRIBIDI_BUILD=OFF
		-DENABLE_HARFBUZZ_MINIMAL=OFF
	)
#		-DENABLE_TUI=$(usex tui)
	cmake_src_configure
}

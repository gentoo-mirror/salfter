EAPI=8

inherit cmake

DESCRIPTION="A tag editor with command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska"
HOMEPAGE="https://github.com/Martchus/tageditor"
SRC_URI="https://github.com/Martchus/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

# NOTE: QT interface is not built

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE="qt"

RDEPEND="dev-util/cpp-utilities
	 media-sound/tagparser"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DWIDGETS_GUI=OFF 
		-DQUICK_GUI=OFF
	)

	cmake_src_configure
}

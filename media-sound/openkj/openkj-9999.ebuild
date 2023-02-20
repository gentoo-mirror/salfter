EAPI=8

inherit cmake git-r3

DESCRIPTION="karaoke show hosting software"
HOMEPAGE="https://openkj.org/"
EGIT_REPO_URI="https://github.com/OpenKJ/OpenKJ"
LICENSE="GPL-3"
SLOT=0
KEYWORDS=""

DEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	media-libs/gstreamer
	dev-libs/spdlog
	media-libs/taglib
	media-plugins/gst-plugins-mpg123
	media-plugins/gst-plugins-faad
	media-plugins/gst-plugins-flac
	media-plugins/gst-plugins-opus
	<dev-libs/libfmt-9
	"

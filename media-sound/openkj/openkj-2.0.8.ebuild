EAPI=8

inherit cmake

DESCRIPTION="karaoke show hosting software"
HOMEPAGE="https://openkj.org/"
SRC_URI="https://github.com/OpenKJ/OpenKJ/archive/refs/tags/v2.0.8-release.tar.gz -> $P.tar.gz"
LICENSE="GPL-3"
SLOT=0
KEYWORDS="amd64"
S=$WORKDIR/OpenKJ-$PV-release

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
       "
EAPI=5
inherit qt4-r2 eutils multilib

DESCRIPTION="Video metadata scraper"
# http://www.kvibes.de/releases/mediaelch/2.1.2/mediaelch-2.1.2.tar.gz
SRC_URI="http://www.kvibes.de/releases/${PN}/${PV}/${P}.tar.gz"
HOMEPAGE="http://www.mediaelch.de/"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="amd64 x86"
#IUSE="+anthy"

DEPEND="dev-qt/qtsql dev-qt/qtscript dev-qt/qtxmlpatterns dev-qt/qtcore dev-qt/qtgui media-video/mediainfo media-libs/libzen media-libs/phonon dev-libs/quazip"



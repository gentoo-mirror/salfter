EAPI=5
inherit qt4-r2 eutils multilib

DESCRIPTION="Video metadata scraper"
SRC_URI="http://www.kvibes.de/releases/${PN}/${PV}/${P}.tar.gz"
HOMEPAGE="http://www.mediaelch.de/"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="amd64 x86"

DEPEND="dev-qt/qtsql:4 
	    dev-qt/qtscript:4 
	    dev-qt/qtxmlpatterns:4 
	    dev-qt/qtcore:4 
	    dev-qt/qtgui:4 
	    media-video/mediainfo 
	    media-libs/libzen 
	    media-libs/phonon 
	    dev-libs/quazip"

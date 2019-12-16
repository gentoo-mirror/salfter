EAPI=6
inherit qmake-utils eutils multilib

MY_PN=MediaElch
S=$WORKDIR/$MY_PN-$PV

DESCRIPTION="Video metadata scraper"
SRC_URI="https://github.com/Komet/$MY_PN/archive/v${PV}.tar.gz -> $P.tar.gz"
HOMEPAGE="http://www.mediaelch.de/"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="amd64 x86"

DEPEND="dev-qt/qtsql:5 
		dev-qt/qtscript:5 
		dev-qt/qtquickcontrols:5
		dev-qt/qtxmlpatterns:5 
		dev-qt/qtcore:5 
		dev-qt/qtgui:5
		media-video/mediainfo 
		media-libs/libzen 
		media-libs/phonon 
		dev-libs/quazip 
		dev-qt/qtconcurrent:5
		dev-qt/qtmultimedia:5[widgets]
		dev-qt/qtscript:5"
		
src_configure()
{
	cd $S || die
	eqmake5 || die	
}

src_install()
{
	dobin $S/MediaElch
}

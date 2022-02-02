EAPI=8
inherit qmake-utils 

DESCRIPTION="Video metadata scraper"
# tarball produced with this command:
# docker run "-v${PWD}:/a" devsisters/tarballize https://github.com/Komet/MediaElch v2.8.12
SRC_URI="https://alfter.us/wp-content/uploads/2022/02/mediaelch-v2.8.12.tar.xz"
S=$WORKDIR/v$PV
HOMEPAGE="https://www.kvibes.de/mediaelch/"

SLOT="0"
LICENSE="LGPL-3"
KEYWORDS="amd64 x86"

DEPEND="dev-qt/qtquickcontrols:5
	dev-qt/qtcore:5 
	media-video/mediainfo 
	dev-qt/qtmultimedia:5[widgets]
	dev-qt/qtdeclarative:5
	dev-qt/qtopengl:5
	dev-qt/qtsvg:5"

src_configure()
{
	cd $S || die
	eqmake5 || die
}

src_install()
{
  dobin $S/MediaElch 
  insinto /usr/share/applications
  doins $S/data/desktop/MediaElch.desktop 
  insinto /usr/share/pixmaps
  doins $S/data/desktop/MediaElch.png 
  insinto /usr/share/metainfo
  doins $S/data/desktop/com.kvibes.MediaElch.metainfo.xml 
}

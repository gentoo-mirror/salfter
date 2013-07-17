EAPI=5
inherit eutils subversion

DESCRIPTION="HTTP Live Streaming segmenter"
HOMEPAGE="http://www.espend.de/artikel/iphone-ipad-ipod-http-streaming-segmenter-and-m3u8-windows.html"
ESVN_REPO_URI="http://httpsegmenter.googlecode.com/svn/trunk/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="**"
DEPEND="media-video/ffmpeg"

src_compile() {
	echo ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}
	make -f Makefile.txt
}

src_install() {
	cd ${WORKDIR}/${P}
	dobin segmenter
}

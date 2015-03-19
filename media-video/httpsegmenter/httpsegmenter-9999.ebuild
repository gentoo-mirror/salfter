EAPI=5
inherit eutils subversion

DESCRIPTION="HTTP Live Streaming segmenter"
HOMEPAGE="http://www.espend.de/artikel/iphone-ipad-ipod-http-streaming-segmenter-and-m3u8-windows.html"
ESVN_REPO_URI="http://httpsegmenter.googlecode.com/svn/trunk/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="**"
IUSE="libav"
DEPEND="!libav? ( media-video/ffmpeg ) 
		libav?  ( media-video/libav )"
                                                
src_compile() {
	cd ${WORKDIR}/${P}
	make -f Makefile.txt
}

src_install() {
	cd ${WORKDIR}/${P}
	dobin segmenter
}

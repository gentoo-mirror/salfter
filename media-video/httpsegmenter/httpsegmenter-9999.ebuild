EAPI=5
inherit eutils git-2

DESCRIPTION="HTTP Live Streaming segmenter"
HOMEPAGE="http://www.espend.de/artikel/iphone-ipad-ipod-http-streaming-segmenter-and-m3u8-windows.html"
EGIT_REPO_URI="https://github.com/salfter/httpsegmenter"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="**"
DEPEND="virtual/ffmpeg"
                                                
src_compile() {
	cd ${WORKDIR}/${P}
	make -f Makefile.txt
}

src_install() {
	cd ${WORKDIR}/${P}
	dobin segmenter
}

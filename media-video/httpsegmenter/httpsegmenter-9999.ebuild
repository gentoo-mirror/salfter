EAPI=7
inherit eutils git-r3

DESCRIPTION="HTTP Live Streaming segmenter"
HOMEPAGE="http://www.espend.de/artikel/iphone-ipad-ipod-http-streaming-segmenter-and-m3u8-windows.html"
EGIT_REPO_URI="https://gitlab.com/salfter/httpsegmenter.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="virtual/ffmpeg"
                                                
src_compile() {
	cd ${WORKDIR}/${P}
	make -f Makefile.txt
}

src_install() {
	cd ${WORKDIR}/${P}
	dobin segmenter
}

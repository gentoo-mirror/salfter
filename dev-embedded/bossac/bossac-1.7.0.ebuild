EAPI=6

PN=BOSSA
S=$WORKDIR/$PN-$PV

inherit eutils

DESCRIPTION="flash programming utility for Atmel's SAM family of flash-based ARM microcontrollers"
HOMEPAGE=http://www.shumatech.com/web/products/bossa
SRC_URI="https://github.com/shumatech/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE=BSD
SLOT=0
KEYWORDS="~arm64 ~amd64"

src_compile()
{
	emake bin/bossac
}

src_install()
{
	dobin bin/bossac
}

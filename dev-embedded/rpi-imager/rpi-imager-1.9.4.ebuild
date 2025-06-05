EAPI=8

inherit cmake

DESCRIPTION="Raspberry Pi Imaging Utility"
HOMEPAGE=https://www.raspberrypi.com/software/
SRC_URI="https://github.com/raspberrypi/${PN}/releases/download/v${PV}/${PN}_${PV}.tar.xz -> ${P}.tar.xz"
LICENSE=Apache-2.0
SLOT=0
KEYWORDS="amd64 aarch64"
S=$WORKDIR/$PN/src

DEPEND="
	dev-qt/qtbase
	dev-qt/qtdbus
	sys-libs/zlib
	app-arch/lzma
	|| ( net-libs/gnutls dev-libs/openssl )
       "

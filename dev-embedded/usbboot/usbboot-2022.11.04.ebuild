EAPI=8

DESCRIPTION="tool to load Raspberry Pi Compute Modules over USB"
HOMEPAGE=https://github.com/raspberrypi/usbboot/
GIT_COMMIT=a6976b714821ea372706c923f8ba30d0594eb12c
S=$WORKDIR/$PN-$GIT_COMMIT
SRC_URI="https://github.com/raspberrypi/$PN/archive/${GIT_COMMIT}.tar.gz -> $P.tar.gz"
LICENSE=Apache-2.0
SLOT=0
KEYWORDS="amd64 aarch64"

RDEPEND="virtual/libusb:1"

src_install()
{
  dobin $S/rpiboot
}

EAPI=8

DESCRIPTION="tool to load Raspberry Pi Compute Modules over USB"
HOMEPAGE=https://github.com/raspberrypi/usbboot/
GIT_COMMIT=82d875522d1a0896e55c90f9e9f47cb4640812c9
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

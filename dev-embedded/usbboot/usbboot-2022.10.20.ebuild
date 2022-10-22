EAPI=8

DESCRIPTION="tool to load Raspberry Pi Compute Modules over USB"
HOMEPAGE=https://github.com/raspberrypi/usbboot/
GIT_COMMIT=15aac0cd08039ac28225d5820c38c4ce733f0cd8
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

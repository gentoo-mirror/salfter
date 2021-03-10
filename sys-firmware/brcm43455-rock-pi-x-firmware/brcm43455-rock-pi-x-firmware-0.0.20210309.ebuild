EAPI=7

DESCRIPTION="firmware for Broadcom 43455 WiFi/Bluetooth on Rock Pi X"
HOMEPAGE="https://dl.radxa.com/rockpix/"
SRC_URI="https://dl.radxa.com/rockpix/drivers/firmware/AP6255_BT_WIFI_Firmware.zip"
S="$WORKDIR/BT_WIFI_Firmware"

LICENSE="Broadcom"
SLOT="0"
KEYWORDS="amd64"

DEPEND="!sys-kernel/genkernel[firmware]
	!sys-kernel/linux-firmware"

src_install() {
  cd $S
  insinto /lib/firmware/brcm
  #newins wifi/brcmfmac43455c0-sdio.bin brcmfmac43455-sdio.bin
  newins "wifi/brcmfmac43455-sdio.ROCK Pi-ROCK Pi X.txt" "brcmfmac43455-sdio.Radxa-ROCK Pi X.txt"
  doins "bt/BCM4345C0.hcd"
}

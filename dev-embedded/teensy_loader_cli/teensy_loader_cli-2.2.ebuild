# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Command line Teensy Loader"
HOMEPAGE="http://www.pjrc.com/teensy/loader_cli.html"

SRC_URI="https://github.com/PaulStoffregen/$PN/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="virtual/libusb:0"
RDEPEND="${DEPEND}"

src_install() {
	dobin teensy_loader_cli
}

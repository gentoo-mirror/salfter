# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

MY_PN="${PN//-/_}"
MY_PN="${MY_PN/teensy_}"
DESCRIPTION="Command line HID-raw listener for Teensy microcontrollers"
HOMEPAGE="http://pjrc.com/teensy/${MY_PN}.html"
SRC_URI="http://pjrc.com/teensy/${MY_PN}_${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libusb"
RDEPEND="$DEPEND"

S="${WORKDIR}/${MY_PN}"

src_compile() {
	emake OS=LINUX "CFLAGS=${CFLAGS}" "LDFLAGS=${LDFLAGS}" STRIP=echo
}

src_install() {
	cp hid_listen teensy_hid_listen
	dobin teensy_hid_listen
}

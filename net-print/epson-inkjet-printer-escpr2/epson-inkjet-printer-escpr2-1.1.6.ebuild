# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm

DESCRIPTION="Epson Inkjet Printer Driver (ESC/P-R) 2"
HOMEPAGE="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/10/63/40/79e6fb572dd67237635b31f279d3cc43c8885be5/epson-inkjet-printer-escpr2-1.1.6-1lsb3.2.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="net-print/cups"
DEPEND="${RDEPEND}"

PATCHES=(
	"$FILESDIR/bug_x86_64.patch"
)

src_configure() {
	econf --disable-shared

	# Makefile calls ls to generate a file list which is included in Makefile.am
	# Set the collation to C to avoid automake being called automatically
	unset LC_ALL
	export LC_COLLATE=C
}

src_install() {
	emake -C ppd DESTDIR="${D}" install
	emake -C src DESTDIR="${D}" install
	einstalldocs
}
# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="MP3 validator"
HOMEPAGE="http://mp3val.sourceforge.net/"
SRC_URI="mirror://sourceforge/mp3val/${P}-src.tar.gz"
S=$WORKDIR/$P-src

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

PATCHES=( $FILESDIR/$P-gcc-4.3.patch
	  $FILESDIR/$P-makefile-opts.patch )

src_compile() {
	emake -f Makefile.linux
}

src_install() {
	dobin $S/mp3val
}

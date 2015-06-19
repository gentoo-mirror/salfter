# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="MP3 validator"
HOMEPAGE="http://mp3val.sourceforge.net/"
SRC_URI="mirror://sourceforge/mp3val/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack() {
	unpack ${A} || die "unpack failed"
	epatch ${FILESDIR}/${P}-gcc-4.3.patch || die "epatch failed"
	epatch ${FILESDIR}/${P}-makefile-opts.patch || die "epatch failed"
}

src_compile() {
	cd ${WORKDIR}/${P}-src
	make -f Makefile.linux || die "make failed"
}

src_install() {
	mkdir -p ${D}/usr/bin || die "mkdir failed"
	cp ${WORKDIR}/${P}-src/mp3val ${D}/usr/bin || die "cp failed"
}

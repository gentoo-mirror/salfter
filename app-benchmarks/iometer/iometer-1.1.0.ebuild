# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_P=${PN}-${PV//./_}
S=${WORKDIR}/${MY_P}.common-src

DESCRIPTION="I/O subsystem measurement and characterization tool for single and clustered systems"
HOMEPAGE="http://www.iometer.org/"
#SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/${PN}/${MY_P}.common-src.zip"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.bz2 -> ${P}.tar.bz2"

LICENSE="ipw3945"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	cd ${P}/src || die "Directory '${P}/src' in '`pwd`' not found."
	if [ ! -f Makefile-Linux.i386 ] ; then
		die "File 'Makefile-Linux.i386' not found."
	fi

	cp Makefile-Linux.i386 Makefile
	emake dynamo || die 
}

src_install() {
	cd ${P}/src || die "Directory '${P}/src' in '`pwd`' not found."	
	dobin dynamo
	cd ..
	dodoc CHANGELOG.txt CREDITS.txt DEVGUIDE.txt LICENSE.txt README.txt
	docinto misc
	dodoc misc/graph.pl misc/Wizard.mdb
	docinto misc/Installer
	dodoc misc/Installer/*
}

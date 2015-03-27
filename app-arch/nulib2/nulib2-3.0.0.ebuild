# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="utility & library for manipulating NuFX archives"
HOMEPAGE="http://www.nulib.com/"
SRC_URI="https://github.com/fadden/nulib2/archive/v3.0.0.tar.gz -> nulib2-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_configure() {
	cd ${S}/nufxlib || die
	econf || die "./configure failed"
	cd ${S}/nulib2 || die
	econf || die "./configure failed"
}

src_compile() {
	cd ${S}/nufxlib
	make || die "emake failed"
	cd ${S}/nulib2
	make || die "emake failed"
}

src_install() {
	cd ${S}/nufxlib
        einstall libdir="${D}"/usr/$(get_libdir) || die
	cd ${S}/nulib2
        einstall || die
}

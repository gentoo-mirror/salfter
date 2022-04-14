# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="library for manipulating NuFX archives"
HOMEPAGE="http://www.nulib.com/"
SRC_URI="https://github.com/fadden/nulib2/archive/v3.1.0.tar.gz -> nulib2-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE=""

S=$WORKDIR/nulib2-$PV/$PN

src_prepare() {
  eapply_user
  eapply $FILESDIR/$P-make.patch
}

src_install() {
  cd $S
  make install libdir="${D}"/usr/$(get_libdir) includedir=$D/usr/include
}

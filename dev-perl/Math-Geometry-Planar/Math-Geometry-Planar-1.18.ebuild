# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=DVDPOL
DIST_VERSION=1.18
DIST_A_EXT=tar.gz

inherit perl-module

DESCRIPTION="A collection of planar geometry functions"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=dev-perl/Math-Geometry-Planar-GPC-1.04
         >=dev-perl/Math-Geometry-Planar-Offset-1.03"

SRC_TEST=do

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=DVDPOL
MODULE_VERSION=1.18
inherit perl-module

DESCRIPTION="A collection of planar geometry functions"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=dev-perl/Math-Geometry-Planar-GPC-1.04
         >=dev-perl/Math-Geometry-Planar-Offset-1.03"

SRC_TEST=do

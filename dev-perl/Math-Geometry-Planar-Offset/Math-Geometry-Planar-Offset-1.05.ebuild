# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=EWILHELM
DIST_VERSION=1.05
DIST_A_EXT=tar.gz

inherit perl-module

DESCRIPTION="Calculate offset polygons"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

SRC_TEST=do

BDEPEND="dev-perl/Module-Build"

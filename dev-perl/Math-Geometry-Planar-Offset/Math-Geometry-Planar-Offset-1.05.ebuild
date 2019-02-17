# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=EWILHELM
MODULE_VERSION=1.05
inherit perl-module

DESCRIPTION="Calculate offset polygons"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

SRC_TEST=do

DEPEND="dev-perl/Module-Build"

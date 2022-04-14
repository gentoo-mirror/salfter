# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=DVDPOL
DIST_VERSION=1.04
DIST_A_EXT=tar.gz

inherit perl-module

DESCRIPTION="Perl wrapper for Alan Murta's gpc library"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

SRC_TEST=do

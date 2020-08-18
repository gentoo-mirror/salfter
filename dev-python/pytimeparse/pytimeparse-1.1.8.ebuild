# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{4,5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="time expression parser"
HOMEPAGE="https://github.com/wroberts/pytimeparse"
SRC_URI="https://github.com/wroberts/$PN/releases/download/$PV/$P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""


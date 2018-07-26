# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} pypy )

inherit distutils-r1

MY_PN="${PN}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="wrapper for subprocess which provides command pipeline functionality"
HOMEPAGE="http://sarge.readthedocs.org/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
DEPEND=""


# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_{3,4,5,6,7}} pypy )

inherit distutils-r1

DESCRIPTION="collection of decorators for profiling functions"
HOMEPAGE="https://pypi.org/project/profilehooks/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""


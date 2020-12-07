# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7,8,9} pypy3 )

inherit distutils-r1

GIT_COMMIT=c1644b831bcc422d6d3ed793f4f3ae030dcc26c3
S=${WORKDIR}/pybitcointools-${GIT_COMMIT}

DESCRIPTION="Python Bitcoin Tools"
HOMEPAGE="https://github.com/primal100/pybitcointools"
SRC_URI="https://github.com/primal100/pybitcointools/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND=""


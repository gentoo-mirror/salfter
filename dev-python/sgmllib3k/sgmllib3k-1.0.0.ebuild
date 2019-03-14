# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} pypy{,3} )

inherit distutils-r1

DESCRIPTION="Py3k port of sgmllib"
HOMEPAGE="http://hg.hardcoded.net/sgmllib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

# sgmllib is licensed under PSF-2.
LICENSE="BSD-2 PSF-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""





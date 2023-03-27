# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3)

inherit distutils-r1

DESCRIPTION="Base58 and Base58Check implementation"
HOMEPAGE="https://pypi.python.org/pypi/base58"
SRC_URI="https://github.com/keis/base58/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND=""


# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10} pypy3)

inherit distutils-r1

DESCRIPTION="Library for creating and working with private keys, public keys, and bitcoin addresses."
HOMEPAGE="https://pypi.python.org/pypi/keylib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND=">=dev-python/base58-0.2.1
	>=dev-python/ecdsa-0.10
	>=dev-python/six-1.5.2
	>=dev-python/cachetools-1.1.1"


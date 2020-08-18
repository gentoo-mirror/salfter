# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_{4,5,6,7,8,9}} pypy )

inherit distutils-r1

DESCRIPTION="Simple bencode parser"
HOMEPAGE="https://github.com/fuzeman/bencode.py/"
SRC_URI="mirror://pypi/${PN:0:1}/bencode.py/bencode.py-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/bencode.py-${PV}"

LICENSE="bittorrent-osl"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        >dev-python/pbr-1.9[${PYTHON_USEDEP}]"


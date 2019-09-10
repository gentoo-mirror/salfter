# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="JavaScript to Python Translator & JavaScript interpreter written in 100% pure Python"
HOMEPAGE="https://github.com/PiotrDabkowski/Js2Py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/tzlocal-1.2
	>=dev-python/six-1.1.0
	>=dev-python/pyjsparser-2.5.1
"
DEPEND=""


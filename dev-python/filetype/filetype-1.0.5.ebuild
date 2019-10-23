# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )

inherit distutils-r1

DESCRIPTION="Small and dependency free Python package to infer file type and MIME type checking the magic numbers signature of a file or buffer."
HOMEPAGE="https://pypi.org/project/filetype/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

PATCHES="$FILESDIR/$P-no-examples.patch"

python_test() {
	esetup.py test
}

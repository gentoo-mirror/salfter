# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GIT_COMMIT=f403000dd63092cfaaae80be9f309fd85c7f20c9
S=$WORKDIR/$PN-$GIT_COMMIT

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )

inherit distutils-r1

DESCRIPTION="Python library to work with countries and languages"
HOMEPAGE="https://github.com/Diaoul/babelfish https://pypi.org/project/babelfish/"
SRC_URI="https://github.com/Diaoul/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

python_test() {
	esetup.py test
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6,7}} )
PYTHON_REQ_USE='xml(+)'

GIT_COMMIT=665cf6948aab1c249dcc99bd9624a81d17b3302a
S=$WORKDIR/$PN-$GIT_COMMIT

inherit distutils-r1

DESCRIPTION="Python video metadata parser"
HOMEPAGE="https://github.com/pymedusa/enzyme"
SRC_URI="https://github.com/pymedusa/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		app-arch/unzip
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	if use test; then
		mkdir enzyme/tests/test_{mkv,parsers} || die
		ln -s "${WORKDIR}"/test*.mkv enzyme/tests/test_mkv/ || die
		ln -s "${WORKDIR}"/test*.mkv enzyme/tests/test_parsers/ || die
	fi

	distutils-r1_python_prepare_all
}

python_test() {
	esetup.py test
}

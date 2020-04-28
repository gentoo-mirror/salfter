# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6,7}} )

inherit distutils-r1

GIT_COMMIT=6adb3ab5ebdbcfe0c5c469095241a55084ed50fa
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="Python library that performs advanced searches in strings"
HOMEPAGE="https://github.com/Toilal/rebulk https://pypi.org/project/rebulk/"
SRC_URI="https://github.com/Toilal/rebulk/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-runner[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	# Remove base64-encoded zip archive with pytest.
	rm runtests.py || die

	# Disable unconditional dependency on dev-python/pytest-runner.
	sed -i -e "s|'pytest-runner'||g" setup.py || die

	distutils-r1_python_prepare_all
}

python_test() {
	esetup.py test
}

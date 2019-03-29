# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} pypy )

inherit distutils-r1

DESCRIPTION="Python client for Sentry"
HOMEPAGE="https://getsentry.com https://pypi.org/project/sentry-sdk/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-fbsd ~x64-solaris"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/urllib3
	dev-python/certifi
"

python_test() {
	if [[ ${EPYTHON} == python2* || ${EPYTHON} == pypy ]]; then
		cd "${S}"/python2 || die
	else
		cd "${S}"/src || die
	fi

	"${PYTHON}" test_typing.py || die "tests failed under ${EPYTHON}"
}

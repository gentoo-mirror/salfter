EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1

DEPEND=""
RDEPEND=""

MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="an immutable wrapper around dictionaries that implements the complete mapping interface"
HOMEPAGE="https://github.com/slezica/python-frozendict"
LICENSE="MIT"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
SLOT="0"
KEYWORDS="~arm64 ~amd64"


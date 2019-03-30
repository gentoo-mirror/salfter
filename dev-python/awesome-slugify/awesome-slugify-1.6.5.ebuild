EAPI=5
PYTHON_COMPAT=(python{2_6,2_7} python3_4 pypy pypy3)

inherit distutils-r1

DEPEND=""
RDEPEND="dev-python/regex >=dev-python/unidecode-0.04.14 <dev-python/unidecode-0.05"

MY_PN=${PN}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Python flexible slugify function"
HOMEPAGE="https://github.com/dimka665/awesome-slugify"
LICENSE="GPL-3"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
SLOT="0"
KEYWORDS="~arm64 ~amd64"


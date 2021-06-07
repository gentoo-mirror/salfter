EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} pypy3)

inherit distutils-r1

DESCRIPTION="Simple function-wrapping API with ctypes"
HOMEPAGE="https://github.com/tmr232/pywrap"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

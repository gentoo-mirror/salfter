EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND="dev-python/pycurl"

DESCRIPTION="Python binding for the Poloniex altcoin-trading API"
HOMEPAGE="https://github.com/salfter/poloniex"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/salfter/poloniex"
SLOT="0"
KEYWORDS="~amd64"


EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND="dev-python/pycurl"

DESCRIPTION="Python binding for the Cryptsy altcoin-trading API"
HOMEPAGE="https://github.com/salfter/PyCryptsy"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/salfter/PyCryptsy"
SLOT="0"
KEYWORDS="~amd64"


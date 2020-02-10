EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-r3 

DEPEND=""
RDEPEND="dev-python/pycurl"

DESCRIPTION="Python binding for the Cryptopia altcoin-trading API"
HOMEPAGE="https://gitlab.com/salfter/PyCryptopia"
LICENSE="MIT"
EGIT_REPO_URI="https://gitlab.com/salfter/PyCryptopia.git"
SLOT="0"
KEYWORDS="~amd64"


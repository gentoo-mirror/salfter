EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND="dev-python/pycurl"

DESCRIPTION="Python binding for the C-CEX altcoin-trading API"
HOMEPAGE="https://gitlab.com/salfter/PyCCEX"
LICENSE="MIT"
EGIT_REPO_URI="https://gitlab.com/salfter/PyCCEX.git"
SLOT="0"
KEYWORDS="~amd64"


EAPI=5

inherit distutils git-2 

DEPEND=""
RDEPEND="dev-python/pycurl"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

DESCRIPTION="Python binding for the C-CEX altcoin-trading API"
HOMEPAGE="https://github.com/salfter/PyCCEX"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/salfter/PyCCEX"
SLOT="0"
KEYWORDS="~amd64"


EAPI=3

inherit distutils git-2

DEPEND=""
RDEPEND=""

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
#RESTRICT_PYTHON_ABIS="3.*"

DESCRIPTION="Python interface to bitcoind's JSON-RPC API"
HOMEPAGE="https://github.com/jgarzik/python-bitcoinrpc/"
LICENSE="GPL-2.1"

EGIT_REPO_URI="https://github.com/jgarzik/python-bitcoinrpc/"
SLOT="0"
KEYWORDS="~amd64 ~x86"


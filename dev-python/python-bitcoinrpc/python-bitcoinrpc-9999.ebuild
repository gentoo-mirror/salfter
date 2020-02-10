
EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-r3

DEPEND=""
RDEPEND=""

DESCRIPTION="Python interface to bitcoind's JSON-RPC API"
HOMEPAGE="https://github.com/jgarzik/python-bitcoinrpc/"
LICENSE="GPL-2.1"

EGIT_REPO_URI="https://github.com/jgarzik/python-bitcoinrpc/"
SLOT="0"
KEYWORDS="~amd64 ~x86"


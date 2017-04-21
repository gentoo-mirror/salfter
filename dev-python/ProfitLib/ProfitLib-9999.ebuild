EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND="dev-python/bitcoinrpc[jsonrpc-compat]
		 dev-python/PyCryptsy
		 dev-python/PyCryptopia
		 dev-python/PyCCEX
		 dev-python/poloniex
		 dev-python/bleuBot
		 dev-python/python-bittrex"

DESCRIPTION="altcoin mining profitability calculator"
HOMEPAGE="https://gitlab.com/salfter/ProfitLib"
LICENSE="MIT"
EGIT_REPO_URI="https://gitlab.com/salfter/ProfitLib.git"
SLOT="0"
KEYWORDS="~amd64"


EAPI=5

inherit distutils git-2 

DEPEND=""
RDEPEND="dev-python/bitcoinrpc[jsonrpc-compat]
		 dev-python/PyCryptsy
		 dev-python/PyCryptopia
		 dev-python/PyCCEX
		 dev-python/poloniex
		 dev-python/bleuBot
		 dev-python/python-bittrex"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

DESCRIPTION="altcoin mining profitability calculator"
HOMEPAGE="https://github.com/salfter/ProfitLib"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/salfter/ProfitLib"
SLOT="0"
KEYWORDS="**"


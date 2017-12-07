# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="Library for Bitcoin & other cryptocurrencies. Tools are provided for blockchain transactions, RPC calls, and private keys, public keys, and addresses."
HOMEPAGE="https://pypi.python.org/pypi/pybitcoin"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/requests-2.4.3
	>=dev-python/ecdsa-0.13
	=dev-python/commontools-0.1.0
	>=dev-python/utilitybelt-0.2.1
	dev-python/python-bitcoinrpc
	>=dev-python/keychain-0.1.4
	>=dev-python/bitcoin-1.1.42"


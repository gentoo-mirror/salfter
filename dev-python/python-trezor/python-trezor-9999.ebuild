EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND=">=dev-python/ecdsa-0.9
	 >=dev-python/protobuf-python-3.0.0
	 >=dev-python/python-mnemonic-0.17
	 >=dev-python/cython-hidapi-0.7.99
	 >=dev-python/requests-2.4.0
	 >=dev-python/click-6.2
	 dev-python/pbkdf2"

DESCRIPTION="Client side implementation for TREZOR-compatible Bitcoin hardware wallets"
HOMEPAGE="https://github.com/trezor/python-trezor"
LICENSE="LGPL-3"
EGIT_REPO_URI="https://github.com/trezor/python-trezor"
SLOT="0"
KEYWORDS="~amd64"


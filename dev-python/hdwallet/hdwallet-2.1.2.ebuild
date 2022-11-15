EAPI=7
PYTHON_COMPAT=( python3_{7,8,9,10,11} )

inherit distutils-r1

DESCRIPTION="Hierarchical Deterministic Wallet"
HOMEPAGE="https://github.com/meherett/python-hdwallet"
SRC_URI="https://github.com/meherett/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/python-$P

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=">=dev-python/ecdsa-0.13
	 <dev-python/ecdsa-1
	 >=dev-python/mnemonic-0.19
	 <dev-python/mnemonic-1
	 >=dev-python/pysha3-1.0.2
	 <dev-python/pysha3-2
	 >=dev-python/base58-2.0.1
	 <dev-python/base58-3"

src_prepare()
{
	default_src_prepare
	rm -r $S/tests
}

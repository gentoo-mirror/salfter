EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
GIT_COMMIT=fe03e1129e780efd137989ccce0cd8df0106cb2c

inherit distutils-r1

DESCRIPTION="Private Internet Access WireGuard configurator"
HOMEPAGE="https://github.com/hsand/pia-wg"
SRC_URI="https://github.com/hsand/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

RDEPEND=">=dev-python/certifi-2021.5.30
	 >=dev-python/chardet-3.0.4
	 >=dev-python/idna-2.10
	 >=dev-python/pick-1.0.0
	 >=dev-python/requests-2.24.0
	 >=dev-python/requests-toolbelt-0.9.1
	 >=dev-python/urllib3-1.26.6"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

src_unpack() {
	unpack $P.tar.gz
	cd $WORKDIR
	mv $PN-$GIT_COMMIT $P
}

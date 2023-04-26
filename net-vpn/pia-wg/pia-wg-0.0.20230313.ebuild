EAPI=7

PYTHON_COMPAT=( python3_{7,8,9,10,11} )
GIT_COMMIT=35df20e2d267a0ba267258658f988fd576e149e9

inherit distutils-r1

DESCRIPTION="Private Internet Access WireGuard configurator"
HOMEPAGE="https://github.com/jauderho/pia-wg"
SRC_URI="https://github.com/jauderho/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
DISTUTILS_USE_PEP517=no
S=$WORKDIR/$PN-$GIT_COMMIT

PATCHES="$FILESDIR/$PN-hashbang.patch"

RDEPEND=">=dev-python/certifi-2022.12.7
	 >=dev-python/chardet-5.1.0
	 >=dev-python/charset_normalizer-3.1.0
	 >=dev-python/idna-3.4
	 >=dev-python/pick-2.2.0
	 >=dev-python/requests-2.28.2
	 >=dev-python/requests-toolbelt-0.10.1
	 >=dev-python/urllib3-1.26.15"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

src_install() {
	cd $S
	dobin generate-config.py
	insinto /usr/bin
	doins piawg.py
	doins ca.rsa.4096.crt
}
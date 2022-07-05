EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11} pypy3)

inherit distutils-r1

DESCRIPTION="support both KiCad 5 & 6 in your plugins"
HOMEPAGE="https://github.com/yaqwsx/pcbnewTransition/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

PATCHES="$FILESDIR/$P-setup.patch"

src_prepare() {
	default
	cp $FILESDIR/$P-version.py $S/$PN/_version.py
}

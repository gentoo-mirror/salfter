EAPI=8

PYTHON_COMPAT=( python3_{8..11} pypy3 )

inherit distutils-r1

DESCRIPTION="support KiCad 5-7 in your plugins"
HOMEPAGE="https://github.com/yaqwsx/pcbnewTransition/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

# recommended by https://github.com/yaqwsx/KiKit/issues/542#issuecomment-1518005553
SRC_URI="https://github.com/set-soft/pcbnewTransition/archive/refs/tags/v0.3.4-4.tar.gz -> $P-r1.tar.gz"
S=$WORKDIR/$P-4

DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"


EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="support KiCad 5-7 in your plugins"
HOMEPAGE="https://github.com/yaqwsx/pcbnewTransition/"
SRC_URI="https://github.com/yaqwsx/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"

DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"


EAPI=7

PYTHON_COMPAT=( python3_{8..12} pypy3 )

inherit distutils-r1

DESCRIPTION="A fully featured, pythonic library for quaternion representation, manipulation, 3D animation and geometry"
HOMEPAGE="http://kieranwynn.github.io/pyquaternion/"
SRC_URI="https://github.com/KieranWynn/$PN/archive/v$PV.tar.gz -> $P.tar.gz"
DISTUTILS_USE_PEP517=setuptools

RDEPEND="dev-python/numpy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

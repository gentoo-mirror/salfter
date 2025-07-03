EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="One Git library to Rule"
HOMEPAGE="https://github.com/packit/ogr"
SRC_URI="https://github.com/packit/ogr/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT=0
KEYWORDS=~amd64


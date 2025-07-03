EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 ) 
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

DESCRIPTION="Dictionary wrapper for quick access to deeply nested keys"
HOMEPAGE="https://github.com/pawelzny/dotty_dict"
SRC_URI="https://github.com/pawelzny/dotty_dict/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/dotty_dict-$PV

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""


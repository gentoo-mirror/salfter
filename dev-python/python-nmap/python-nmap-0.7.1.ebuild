EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="use nmap from Python"
HOMEPAGE="https://xael.org/pages/python-nmap-en.html"
SRC_URI="https://xael.org/pages/$P.tar.gz"

LICENSE="GPL-3"
SLOT=0
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""

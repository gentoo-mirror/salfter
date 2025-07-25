EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="writes Value Change Dump (VCD) files as specified in IEEE 1364-2005"
HOMEPAGE="https://github.com/westerndigitalcorporation/pyvcd"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND=""

distutils_enable_tests pytest

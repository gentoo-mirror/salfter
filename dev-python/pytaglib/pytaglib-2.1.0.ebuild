EAPI=8

PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="cross-platform, Python audio metadata library based on TagLib"
HOMEPAGE="https://github.com/supermihi/pytaglib/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
RDEPEND="media-libs/taglib"

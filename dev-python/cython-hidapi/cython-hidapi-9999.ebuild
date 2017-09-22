EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1 git-r3

DEPEND=""
RDEPEND=">=dev-python/cython-0.24"

DESCRIPTION="Python wrapper for the hidapi"
HOMEPAGE="https://github.com/trezor/cython-hidapi"
LICENSE="GPL-3 BSD"
EGIT_REPO_URI="https://github.com/trezor/cython-hidapi"
EGIT_SUBMODULES=( hidapi )
SLOT="0"
KEYWORDS="~amd64"

#src_prepare() {
#  epatch "$FILESDIR/hidapi-include.patch"
#}
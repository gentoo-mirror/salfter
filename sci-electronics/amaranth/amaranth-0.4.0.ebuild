EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..12} pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/amaranth-lang/amaranth"
EGIT_COMMIT=a2f3c544eef8d55f29f115663eb33a467cc01178
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
PATCHES="$FILESDIR/$P-versioning.patch"
PDM_BUILD_SCM_VERSION=0.4.0

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/jinja
	 dev-python/markupsafe
	 dev-python/six
	 sci-electronics/pyvcd
	 sci-electronics/yosys"


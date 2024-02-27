EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..12} pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/amaranth-lang/amaranth"
EGIT_COMMIT=a430c1d4a37c07328d30e37de15d077c90dc0aa5
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
EGIT_BRANCH=v0.4.x
PATCHES="$FILESDIR/$P-versioning.patch"
PDM_BUILD_SCM_VERSION=$PV

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/jinja
	 dev-python/markupsafe
	 dev-python/six
	 sci-electronics/pyvcd
	 sci-electronics/yosys"


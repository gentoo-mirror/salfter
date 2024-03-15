EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..12} pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/amaranth-lang/amaranth"
EGIT_COMMIT=0564dd5d7853bd768aef8cc1bd8405ec0b7e48c5
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
EGIT_BRANCH=v0.4.x
PATCHES="$FILESDIR/$PN-versioning.patch"
PDM_BUILD_SCM_VERSION=$PV

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/jinja
	 dev-python/markupsafe
	 dev-python/six
	 sci-electronics/pyvcd
	 sci-electronics/yosys"


EAPI=8
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..13} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="Amaranth boards and connectors"
HOMEPAGE="https://github.com/amaranth-lang/amaranth-boards"
EGIT_COMMIT=d2caa61a1ceb851da8e4e1109fddc56dc29e05ec
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
PDM_BUILD_SCM_VERSION=$PV

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sci-electronics/amaranth"
DEPEND="dev-python/wheel
	!sci-electronics/nmigen-boards"


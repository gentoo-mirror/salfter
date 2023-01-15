EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="Amaranth boards and connectors"
HOMEPAGE="https://github.com/amaranth-lang/amaranth-boards"
EGIT_COMMIT=1c72b3800beb4da3dbe108b10adddfc69765efe8
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sci-electronics/amaranth"
DEPEND="dev-python/wheel
	!sci-electronics/nmigen-boards"


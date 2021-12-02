EAPI=7
PYTHON_COMPAT=( python3_{8,9} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="nMigen boards and connectors"
HOMEPAGE="https://github.com/nmigen/nmigen-boards"
EGIT_COMMIT=6f46fe41134465d8ee7159ed4370ceade801b3f6
EGIT_REPO_URI=https://github.com/nmigen/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sci-electronics/nmigen"
DEPEND="dev-python/wheel"


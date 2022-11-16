EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/amaranth-lang/amaranth"
# GitHub tarballs don't work, and PyPi doesn't provide source tarballs
EGIT_COMMIT=39a83f4d995d16364cc9b99da646ff8db6394166
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/jinja
	 dev-python/markupsafe
	 dev-python/six
	 sci-electronics/pyvcd
	 sci-electronics/yosys"
DEPEND="dev-python/pip
	!sci-electronics/nmigen"


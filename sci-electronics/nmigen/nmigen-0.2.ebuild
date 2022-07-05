EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/nmigen/nmigen"
EGIT_COMMIT=71d9eea4a0684551b28c43f5b0492c2d3ea091e4
EGIT_REPO_URI=https://github.com/nmigen/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/jinja
	 dev-python/markupsafe
	 dev-python/six
	 sci-electronics/pyvcd
	 sci-electronics/yosys"
DEPEND="dev-python/pip"


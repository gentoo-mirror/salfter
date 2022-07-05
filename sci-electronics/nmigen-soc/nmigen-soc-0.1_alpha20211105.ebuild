EAPI=7
PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="System on Chip toolkit for nMigen"
HOMEPAGE="https://github.com/nmigen/nmigen-soc"
EGIT_COMMIT=d0e6c70a8802ec2263e9229a20d0ae40c7702441
EGIT_REPO_URI=https://github.com/nmigen/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sci-electronics/nmigen"
DEPEND="dev-python/wheel"


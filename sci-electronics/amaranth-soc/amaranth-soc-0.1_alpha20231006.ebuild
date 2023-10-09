EAPI=8
PYTHON_COMPAT=( python3_{8..12} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="System on Chip toolkit for Amaranth"
HOMEPAGE="https://github.com/amaranth-lang/amaranth-soc"
EGIT_COMMIT=9ffaf949d853467d32e3e19fc0d472de65e45427
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
DISTUTILS_USE_PEP517=setuptools

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sci-electronics/amaranth"
DEPEND="dev-python/wheel
	!sci-electronics/nmigen-soc"


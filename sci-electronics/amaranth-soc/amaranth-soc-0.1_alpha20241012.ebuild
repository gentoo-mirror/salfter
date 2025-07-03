EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 )
DISTUTILS_USE_PEP517=pdm-backend

inherit distutils-r1 git-r3

DESCRIPTION="System on Chip toolkit for Amaranth"
HOMEPAGE="https://github.com/amaranth-lang/amaranth-soc"
EGIT_COMMIT=5c43cf58f15d9cd9c69ff83c97997708d386b2dc
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
PDM_BUILD_SCM_VERSION=$PV

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sci-electronics/amaranth"
DEPEND="dev-python/wheel
	!sci-electronics/nmigen-soc"

src_prepare()
{
  cd $S
  default
  sed -i -e "s/pdm\\.backend\\._vendor\\.//" pdm_build.py
}

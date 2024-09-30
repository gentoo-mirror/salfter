EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 )

inherit distutils-r1 git-r3

DESCRIPTION="System on Chip toolkit for Amaranth"
HOMEPAGE="https://github.com/amaranth-lang/amaranth-soc"
EGIT_COMMIT=746709e1e992bccf6e2362450243cafd00d72a14
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
DISTUTILS_USE_PEP517=pdm-backend
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

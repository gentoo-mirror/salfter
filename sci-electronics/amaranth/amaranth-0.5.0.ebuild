EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{8..13} pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION="A refreshed Python toolbox for building complex digital hardware"
HOMEPAGE="https://github.com/amaranth-lang/amaranth"
EGIT_COMMIT=a0750b89c6060d9f809159a012a26cff4e22e69d
EGIT_REPO_URI=https://github.com/amaranth-lang/$PN
EGIT_BRANCH=v0.5.x
PDM_BUILD_SCM_VERSION=$PV

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/jinja
	 dev-python/markupsafe
	 dev-python/six
	 sci-electronics/pyvcd
	 sci-electronics/yosys"

src_prepare()
{
  cd $S
  default
  sed -i -e "s/pdm\\.backend\\._vendor\\.//" pdm_build.py
}

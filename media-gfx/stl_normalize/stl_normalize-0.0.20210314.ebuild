EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

GIT_COMMIT=9f60064ed329a90bc0f38caf270f19e438eace85

inherit distutils-r1

DESCRIPTION="A script to normalize and validate STL files"
HOMEPAGE="http://kieranwynn.github.io/pyquaternion/"
SRC_URI="https://github.com/revarbat/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
S=$WORKDIR/$PN-$GIT_COMMIT

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	 dev-python/pyquaternion[${PYTHON_USEDEP}]"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

src_compile()
{
  echo -n
}

src_install()
{
  newbin $S/stl_normalize.py stl_normalize
}

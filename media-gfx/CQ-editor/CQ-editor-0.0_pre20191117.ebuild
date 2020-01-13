EAPI=6

GIT_COMMIT=1cee3f4ff90b13e1dbc54bfa22e9286c3e05b10e
S=$WORKDIR/$PN-$GIT_COMMIT

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="CadQuery GUI editor based on PyQT"
HOMEPAGE="https://github.com/CadQuery/CQ-editor"
SRC_URI="https://github.com/CadQuery/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sci-libs/cadquery
	 dev-python/PyQt"
DEPEND=""



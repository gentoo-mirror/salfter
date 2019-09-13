EAPI=5
PYTHON_COMPAT=(python{3_4,3_5,3_6,3_7})

inherit distutils-r1

DEPEND=""
RDEPEND=""

DESCRIPTION="Python TTF file parser"
HOMEPAGE="https://github.com/arpruss/zttf"
LICENSE="Apache-2.0"
GIT_COMMIT=a7d9930ef5319c013cbbbc6390253f0a716bc198
SRC_URI="https://github.com/arpruss/$PN/archive/$GIT_COMMIT.tar.gz -> ${P}.tar.gz"
S=$WORKDIR/$PN-$GIT_COMMIT
SLOT="0"
KEYWORDS="~amd64"


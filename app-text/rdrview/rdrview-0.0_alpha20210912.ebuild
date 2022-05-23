EAPI=7
 
DESCRIPTION="C port of Mozilla's Readability library"
HOMEPAGE="https://github.com/eafer/rdrview"
GIT_COMMIT=9bde19f9e53562790b363bb2e3b15707c8c67676
SRC_URI="https://github.com/eafer/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
S=$WORKDIR/$PN-$GIT_COMMIT
PATCHES=( $FILESDIR/$PN-makefile.patch )
 
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
 
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


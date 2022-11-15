EAPI=8
 
DESCRIPTION="C port of Mozilla's Readability library"
HOMEPAGE="https://github.com/eafer/rdrview"
SRC_URI="https://github.com/eafer/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
PATCHES=( $FILESDIR/$PN-makefile.patch )
 
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""
 
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


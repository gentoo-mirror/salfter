EAPI=6

inherit autotools

DESCRIPTION="CLI and C library for processing triangulated solid meshes"
HOMEPAGE="https://admesh.readthedocs.io/"
SRC_URI="https://github.com/$PN/$PN/archive/v$PV.tar.gz -> $P.tar.gz"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"

src_prepare() {
   default
   eautoreconf
}

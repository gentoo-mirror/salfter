EAPI=8

DESCRIPTION="3D model converter"
SRC_URI="http://www.patrickmin.com/meshconv/linux64/meshconv -> ${P}"
HOMEPAGE="http://www.patrickmin.com/meshconv/"
SLOT="0"
KEYWORDS="~amd64 -*"

src_unpack() {
  mkdir -p ${WORKDIR}/${P}
}

src_prepare() {
  default
}

src_install() {
  newbin ${DISTDIR}/${P} meshconv
}


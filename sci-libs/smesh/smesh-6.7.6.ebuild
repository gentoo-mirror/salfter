EAPI=6
inherit cmake-utils

DESCRIPTION="An extension to oce, provides advanced meshing features"
HOMEPAGE="https://github.com/tpaviot/smesh"
SRC_URI="https://github.com/tpaviot/$PN/archive/$PV.tar.gz -> $P.tar.gz"
LICENSE=LGPL-2.1
SLOT=0
KEYWORDS=amd64

DEPEND=">=sci-libs/oce-0.18.1"


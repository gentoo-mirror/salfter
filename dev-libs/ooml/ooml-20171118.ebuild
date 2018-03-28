EAPI=6

inherit cmake-utils

DESCRIPTION="C++ Object Oriented Mechanics Language"
HOMEPAGE="https://github.com/avalero/OOML"
COMMIT=47564217afa87180e5d42c201eb606777d676362
SRC_URI="https://github.com/avalero/OOML/archive/$COMMIT.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
S=$WORKDIR/OOML-$COMMIT

src_prepare() {
	epatch $FILESDIR/$PN-cmake-libdir.patch
	eapply_user
}

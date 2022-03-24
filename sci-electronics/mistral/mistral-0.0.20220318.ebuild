EAPI=8

inherit cmake

GIT_COMMIT=ebfc0dd2cc7d6d2159b641a397c88554840e93c9
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="Cyclone V bitstream library"
HOMEPAGE="https://github.com/Ravenslofty/mistral"
SRC_URI="https://github.com/Ravenslofty/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE="BSD"
SLOT=0
KEYWORDS=amd64

DEPEND="app-arch/xz-utils"

src_install() {
	cmake_src_install

	# libmistral.so installed in wrong location for (at least) amd64
	mkdir $D/usr/lib64
	mv $D/usr/lib/libmistral.so $D/usr/lib64/
}

EAPI=8

inherit cmake

GIT_COMMIT=488f4e71073062de314c55a037ede7cf03a3324c
DB_GIT_COMMIT=35d900a94ff0db152679a67bf6e4fbf40ebc34aa
S=$WORKDIR/$PN-$GIT_COMMIT/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
SRC_URI="https://github.com/YosysHQ/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/YosysHQ/$PN-db/archive/$DB_GIT_COMMIT.tar.gz -> $PN-db-$PV.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=~amd64

DEPEND="dev-vcs/git
	dev-libs/boost"

src_unpack() {
	unpack $P.tar.gz
	cd $WORKDIR/$P
	unpack $PN-db-$PV.tar.gz
	rmdir database
	mv $PN-db-$DB_GIT_COMMIT database
}

# see https://github.com/YosysHQ/prjtrellis/pull/95
src_configure() {
	local mycmakeargs=(
		-DCURRENT_GIT_VERSION=$GIT_COMMIT
	)
	cmake_src_configure
}

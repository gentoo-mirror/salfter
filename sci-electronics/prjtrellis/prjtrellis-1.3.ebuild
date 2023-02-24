EAPI=8

inherit cmake

RELEASE_GIT_COMMIT=0c522ce818010f6597dd7001d3123ff38c365e50
DB_GIT_COMMIT=35d900a94ff0db152679a67bf6e4fbf40ebc34aa
S=$WORKDIR/$P/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
SRC_URI="https://github.com/YosysHQ/$PN/archive/refs/tags/$PV.tar.gz -> $P.tar.gz
	 https://github.com/YosysHQ/$PN-db/archive/$DB_GIT_COMMIT.tar.gz -> $PN-db-$DB_GIT_COMMIT.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=~amd64

DEPEND="dev-vcs/git
	dev-libs/boost"

src_unpack() {
	unpack $P.tar.gz
	cd $WORKDIR/$P
	unpack $PN-db-$DB_GIT_COMMIT.tar.gz
	rmdir database
	mv $PN-db-$DB_GIT_COMMIT database
	mv database $WORKDIR/$P/
}

# see https://github.com/YosysHQ/prjtrellis/pull/95
src_configure() {
	local mycmakeargs=(
		-DCURRENT_GIT_VERSION=$RELEASE_GIT_COMMIT
	)
	cmake_src_configure
}

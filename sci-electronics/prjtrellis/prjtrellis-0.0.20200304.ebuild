EAPI=6

inherit cmake-utils

GIT_COMMIT=c2cccd24dcad0632586b240d31b1f043f0d0032a
DB_GIT_COMMIT=717478b757a702bbc7e3e11a5fbecee2a64f7922
S=$WORKDIR/$PN-$GIT_COMMIT/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
SRC_URI="https://github.com/SymbiFlow/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/SymbiFlow/$PN-db/archive/$DB_GIT_COMMIT.tar.gz -> $PN-db-$PV.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=~amd64

DEPEND="dev-vcs/git
	dev-libs/boost
	sci-electronics/openocd"

src_unpack() {
	unpack $P.tar.gz
	cd $WORKDIR/$PN-$GIT_COMMIT
	unpack $PN-db-$PV.tar.gz
	rmdir database
	mv $PN-db-$DB_GIT_COMMIT database
}

# see https://github.com/SymbiFlow/prjtrellis/pull/95
src_configure() {
	local mycmakeargs=(
		-DCURRENT_GIT_VERSION=$GIT_COMMIT
	)
	cmake-utils_src_configure
}

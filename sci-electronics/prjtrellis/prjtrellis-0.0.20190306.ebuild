EAPI=6

inherit cmake-utils

GIT_COMMIT=26d6667d7e72ee81c94b0ae2041fcecdcdc795ce
DB_GIT_COMMIT=d0b219af41ae3da6150645fbc5cc5613b530603f
S=$WORKDIR/$PN-$GIT_COMMIT/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
SRC_URI="https://github.com/SymbiFlow/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/SymbiFlow/$PN-db/archive/$DB_GIT_COMMIT.tar.gz -> $PN-db-$PV.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=~amd64

DEPEND="dev-vcs/git
	dev-libs/boost"

src_unpack() {
	unpack $P.tar.gz
	cd $WORKDIR/$PN-$GIT_COMMIT
	unpack $PN-db-$PV.tar.gz
	rmdir database
	mv $PN-db-$DB_GIT_COMMIT database
}


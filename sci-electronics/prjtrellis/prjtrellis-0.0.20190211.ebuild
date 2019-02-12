EAPI=6

inherit cmake-utils

GIT_COMMIT=25e95bc95084e50f941f81f3d68dca3cd8dd2af5
DB_GIT_COMMIT=23630bcb9492e125b58907832c258cc3ecc91936
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


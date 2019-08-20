EAPI=6

inherit cmake-utils

GIT_COMMIT=a67379179985bb12a611c75d975548cdf6e7d12e
DB_GIT_COMMIT=b4d626b6402c131e9a035470ffe4cf33ccbe7986
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


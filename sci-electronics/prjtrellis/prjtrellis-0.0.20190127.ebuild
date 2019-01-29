EAPI=6

inherit cmake-utils

GIT_COMMIT=ce4a961a65519ee2f9140de0bab07911f6f26af7
DB_GIT_COMMIT=d9603500f4a4df5b643c790d0e44bf7c67b755d0
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

#src_compile() {
#	emake DESTDIR="$D" PREFIX=/usr
#}

#src_install() {
#	emake DESTDIR="$D" PREFIX=/usr install	
#}

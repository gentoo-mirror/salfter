EAPI=8

inherit cmake

GIT_COMMIT=e830a28077e1a789d32e75841312120ae624c8d6
DB_GIT_COMMIT=ce8cdafe7a8c718f0ec43895894b668a479ba33f
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
	mv database $WORKDIR/$PN-$GIT_COMMIT/
}

# see https://github.com/YosysHQ/prjtrellis/pull/95
src_configure() {
	local mycmakeargs=(
		-DCURRENT_GIT_VERSION=$GIT_COMMIT
	)
	cmake_src_configure
}

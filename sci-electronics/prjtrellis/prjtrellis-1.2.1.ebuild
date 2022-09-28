EAPI=8

inherit cmake

RELEASE_GIT_COMMIT=3ae21cf6a07f3883fafa5bf31e9104dfa6c9a63f
DB_GIT_COMMIT=0ee729d20eaf9f1e0f1d657bc6452e3ffe6a0d63
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

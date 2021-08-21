EAPI=7

DESCRIPTION="SQLite ORM light header only library for modern C++"
HOMEPAGE="https://github.com/fnc12/sqlite_orm"
CATCH2_VER=2.13.2
SRC_URI="https://github.com/fnc12/$PN/archive/refs/tags/$PV.tar.gz -> $P.tar.gz
	 https://github.com/catchorg/Catch2/archive/refs/tags/v${CATCH2_VER}.tar.gz -> catch2-${CATCH2_VER}.tar.gz"

inherit cmake-utils

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE=""

RDEPEND="dev-db/sqlite"

PATCHES=( $FILESDIR/$PN-no-tests.patch )

src_unpack()
{
  unpack $P.tar.gz
  unpack catch2-${CATCH2_VER}.tar.gz
  rm -r $WORKDIR/$P/dependencies/catch2
  mv $WORKDIR/Catch2-${CATCH2_VER} $WORKDIR/$P/dependencies/catch2
}

src_configure()
{
  local mycmakeargs=(
    BUILD_TESTING=
  )

  cmake-utils_src_configure
}

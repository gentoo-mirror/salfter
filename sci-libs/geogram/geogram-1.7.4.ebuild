EAPI=6

inherit cmake-utils

DESCRIPTION="programming library of geometric algorithms"
HOMEPAGE=http://alice.loria.fr/software/geogram/doc/html/index.html

SRC_URI="https://gforge.inria.fr/frs/download.php/file/38269/$PN_$PV.tar.gz -> $P.tar.gz"
LICENSE=BSD
SLOT=0
KEYWORDS=~amd64
S=${WORKDIR}/${PN}_${PV}

CMAKE_BUILD_TYPE=Release

PATCHES=$FILESDIR/$P-fix-libpath.patch

src_configure()
{
  local mycmakeargs=(
    -DVORPALINE_PLATFORM="Linux64-gcc-dynamic"
  )
  cmake-utils_src_configure
}

src_install()
{
  cmake-utils_src_install
  cd $D/usr/lib && mv * ../lib64
  rmdir $D/usr/lib
  mkdir -p $D/usr/share/doc
  cd $D/usr/doc && mv $PN ../share/doc/$P
  rmdir $D/usr/doc
}

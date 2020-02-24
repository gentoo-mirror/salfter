EAPI=6

DESCRIPTION="Numeric Library Bindings for Boost UBlas"
HOMEPAGE=https://github.com/uBLAS/numeric_bindings

SRC_URI="https://github.com/uBLAS/numeric_bindings/archive/boost_numeric_bindings_v0.99.tar.gz -> $P.tar.gz"
LICENSE=Boost-1.0
SLOT=0
KEYWORDS=~amd64
S=$WORKDIR/numeric_bindings-boost_numeric_bindings_v0.99/boost/numeric/bindings

src_install()
{
  mkdir -p $D/usr/include/boost/numeric/bindings
  cd $S
  cp -r * $D/usr/include/boost/numeric/bindings
#  cp $FILESDIR/FindBoostNumericBindings.cmake $D/usr/share/cmake/Modules/
}

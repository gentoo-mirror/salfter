EAPI=6

DESCRIPTION="Numeric Library Bindings for Boost UBlas"
HOMEPAGE=

SRC_URI="https://git.tiker.net/boost-numeric-bindings.git/snapshot/1f994e8a2e161cddb6577eacc76b7bc358701cbe.tar.gz -> $P.tar.gz"
LICENSE=Boost-1.0
SLOT=0
KEYWORDS=~amd64
S=$WORKDIR/boost-numeric-bindings-1f994e8

src_configure()
{
  cd $S
  python2 configure
}

src_install()
{
  mkdir -p $D/usr/include/boost
  cp -r $S/boost/numeric $D/usr/include/boost/
}

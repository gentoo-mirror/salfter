EAPI=8
DESCRIPTION="efficient compressor for resource-constrained targets"
HOMEPAGE=https://bitbucket.org/magli143/exomizer
SRC_URI="https://bitbucket.org/magli143/$PN/get/df77c879ce2addc027043e5e80e3992a2ec99eb9.tar.bz2 -> $P.tar.bz2"
LICENSE=ZLIB
SLOT=0
KEYWORDS="amd64"
S=$WORKDIR/magli143-exomizer-df77c879ce2a

src_compile()
{
  cd $S/src
  emake
}

src_install()
{
  dobin $S/src/exobasic
  dobin $S/src/exomizer
}

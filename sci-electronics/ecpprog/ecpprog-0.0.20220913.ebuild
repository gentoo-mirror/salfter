EAPI=8

GIT_COMMIT=8af8863855599f4b8ef8f46a336408b1aba60e9d
S=$WORKDIR/$PN-$GIT_COMMIT


DESCRIPTION="A basic driver for FTDI based JTAG probes (FT232H, FT2232H, FT4232H), to program Lattice ECP5/Nexus FPGAs"
HOMEPAGE="https://github.com/gregdavill/ecpprog"
SRC_URI="https://github.com/gregdavill/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-embedded/libftdi"

src_compile()
{
  cd $S/ecpprog
  emake
}

src_install()
{
  cd $S/ecpprog
  DESTDIR=$D PREFIX=/usr emake install
}
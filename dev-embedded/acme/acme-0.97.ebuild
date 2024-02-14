EAPI=8
DESCRIPTION="multi-platform cross assembler for 6502/6510/65816 cpu"
HOMEPAGE=https://sourceforge.net/projects/acme-crossass/
SRC_URI=https://gitlab.alfter.us/salfter/$PN/-/archive/$PV/$P.tar.bz2
LICENSE=GPL-2
SLOT=0
KEYWORDS="amd64"

src_compile()
{
  cd $S/src
  emake
}

src_install()
{
  cd $S/src
  dobin acme
}

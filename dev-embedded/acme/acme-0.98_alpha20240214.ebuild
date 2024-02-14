EAPI=8
inherit git-r3
GIT_COMMIT=910cc235ca0504d202d009f065aebaa29a1cb3ce
DESCRIPTION="multi-platform cross assembler for 6502/6510/65816 cpu"
HOMEPAGE=https://sourceforge.net/projects/acme-crossass/
EGIT_REPO_URI=https://gitlab.alfter.us/salfter/acme
LICENSE=GPL-2
SLOT=0
KEYWORDS=""

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

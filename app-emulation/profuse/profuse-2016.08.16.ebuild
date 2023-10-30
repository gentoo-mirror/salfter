EAPI=8

MY_PV=$(ver_rs 1- -)
DESCRIPTION="ProDOS and Apple Pascal filesystems for FUSE"
HOMEPAGE="https://github.com/ksherlock/profuse"
SRC_URI="https://github.com/ksherlock/$PN/archive/refs/tags/$MY_PV.tar.gz -> $P.tar.gz"
LICENSE=""
SLOT=0
KEYWORDS="amd64 x86"
S=$WORKDIR/$PN-$MY_PV

src_compile()
{
  cd $S
  emake || die
}

src_install()
{
  cd $S/o
  dobin apfm  
  dobin fuse_pascal  
  dobin newfs_pascal  
  dobin profuse  
  dobin xattr
}

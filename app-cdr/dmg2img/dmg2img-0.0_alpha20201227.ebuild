EAPI=8
DESCRIPTION="a tool which allows converting Apple compressed dmg archives to standard (hfsplus) image disk files"
HOMEPAGE=https://github.com/Lekensteyn/dmg2img
GIT_COMMIT=a3e413489ccdd05431401357bf21690536425012
SRC_URI="https://github.com/Lekensteyn/dmg2img/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=GPL-2
SLOT=0
KEYWORDS="amd64"
S=$WORKDIR/$PN-$GIT_COMMIT

src_install()
{
  dobin dmg2img
}

EAPI=8

GIT_COMMIT=d5b5b5008d2f98400206deb182e8ce772b6df9df
SRC_URI="https://github.com/DHowett/framework-ec/archive/${GIT_COMMIT}.tar.gz -> $P.tar.gz" 
DESCRIPTION="EC manipulation tool for the Framework Laptop"
HOMEPAGE=https://github.com/DHowett/framework-ec
LICENSE=BSD-3
SLOT=0
KEYWORDS=amd64
S=$WORKDIR/framework-ec-$GIT_COMMIT

src_compile() 
{
  cd $S && make utils
}

src_install()
{
  cd $S/build/bds/util && dosbin ectool
}

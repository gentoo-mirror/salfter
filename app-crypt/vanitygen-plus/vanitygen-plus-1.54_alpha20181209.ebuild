EAPI="6"

inherit eutils

GIT_COMMIT=22123128ce00e165c96baf40107e8a36cfadfabc

DESCRIPTION="cryptocurrency vanity-address generator"
HOMEPAGE="https://github.com/exploitagency/vanitygen-plus"
SRC_URI="https://github.com/exploitagency/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="opencl"
S=${WORKDIR}/${PN}-${GIT_COMMIT}

PATCHES=$FILESDIR/calc_addrs-pathfix.patch

DEPEND="opencl? ( virtual/opencl )
        >=dev-libs/openssl-1.0.0d
        dev-libs/libpcre
	!app-crypt/vanitygen"

src_compile() 
{
  make vanitygen
  if use opencl
  then
    make oclvanitygen
  fi
}

src_install()
{
  dobin vanitygen
  if use opencl
  then
    dobin oclvanitygen
    insinto /usr/lib/oclvanitygen
    newins calc_addrs.cl calc_addrs.cl
  fi
}


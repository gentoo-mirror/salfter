EAPI=7

inherit eutils

DESCRIPTION="cryptocurrency vanity-address generator"
HOMEPAGE="https://github.com/exploitagency/vanitygen-plus"
SRC_URI="https://github.com/exploitagency/$PN/archive/refs/tags/PLUS${PV}.tar.gz -> $P.tar.gz
	 https://www.openssl.org/source/old/1.0.0/openssl-1.0.0s.tar.gz"
# won't build against OpenSSL 1.1

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="opencl"
S=${WORKDIR}/$PN-PLUS$PV

PATCHES=( $FILESDIR/use-openssl-1.0.patch
	  $FILESDIR/calc_addrs-pathfix.patch )

DEPEND="opencl? ( virtual/opencl )
        dev-libs/libpcre
	!app-crypt/vanitygen"

src_compile() 
{
  cd $WORKDIR/openssl-1.0.0s && make || true
  cd $S && emake vanitygen
  if use opencl
  then
    emake oclvanitygen
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


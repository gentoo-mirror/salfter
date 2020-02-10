# $Header: $

EAPI="4"

inherit eutils git-r3

DESCRIPTION="cryptocurrency vanity-address generator"
HOMEPAGE="https://github.com/exploitagency/vanitygen-plus"
EGIT_REPO_URI="https://github.com/exploitagency/vanitygen-plus"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="opencl"

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

src_prepare()
{
  epatch $FILESDIR/calc_addrs-pathfix.patch
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


# $Header: $

EAPI="4"

inherit eutils git-2

DESCRIPTION="cryptocurrency vanity-address generator"
HOMEPAGE="https://github.com/salfter/vanitygen"
EGIT_PROJECT="vanitygen"
EGIT_REPO_URI="https://github.com/salfter/vanitygen"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="**"
IUSE="opencl"

DEPEND="opencl? ( virtual/opencl )
        >=dev-libs/openssl-1.0.0d
        dev-libs/libpcre"

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


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
    insinto /usr/share/vanitygen
    newins calc_addrs.cl calc_addrs.cl
  fi
}

pkg_postinst()
{
  if use opencl
  then
    elog "To use oclvanitygen, copy /usr/share/vanitygen/calc_addrs.cl to"
    elog "the directory where you plan to run oclvanitygen."
  fi
}
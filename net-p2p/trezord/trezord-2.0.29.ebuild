# $Header: $

EAPI=7

inherit eutils golang-build golang-vcs-snapshot

DESCRIPTION="Trezor Bridge"
HOMEPAGE="https://github.com/trezor/trezord-go"
SRC_URI="https://github.com/trezor/trezord-go/archive/v$PV.tar.gz -> $P.tar.gz"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
EGO_PN=github.com/trezor/trezord-go

src_unpack()
{
  local f
  golang-vcs-snapshot_src_unpack
  pushd "${S}/src/${EGO_PN}" > /dev/null || die
  for f in ${A}; do
    case $f in
      ${PN}-gen-*.tar.*)
        unpack ${f}
        ;;
    esac
  done
}

src_install() 
{
  cd ${WORKDIR}/go/src/github.com/trezor/trezord-go
  newbin trezord-go trezord
}

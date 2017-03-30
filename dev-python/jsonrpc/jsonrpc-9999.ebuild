# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 bzr

DEPEND=""
RDEPEND=""

DESCRIPTION="JSON-RPC for Python"
HOMEPAGE="http://json-rpc.org/wiki/python-json-rpc"
LICENSE="LGPL-2.1"

EBZR_REPO_URI="http://bzr.json-rpc.org/trunk/"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
  cd ${WORKDIR} || die
  mv ${P}/python-jsonrpc ${P}.new || die
  rm -r ${P} || die
  mv ${P}.new ${P} || die
}

src_compile() {
  echo ""
}

src_install() {
  distutils-r1_src_install
}


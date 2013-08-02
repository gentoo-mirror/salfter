# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils bzr

DEPEND=""
RDEPEND=""

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

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
  distutils_src_install
}


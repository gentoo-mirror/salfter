# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils git-2 

DEPEND=""
RDEPEND=""

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

DESCRIPTION="Python Litecoin SCrypt library from github:forrestv/p2pool"
HOMEPAGE="https://github.com/Tydus/litecoin_scrypt"
LICENSE="BSD-2"
EGIT_REPO_URI="https://github.com/Tydus/litecoin_scrypt"
SLOT="0"
KEYWORDS="~amd64"

#src_prepare() {
#  cd ${WORKDIR} || die
#  mv ${P}/python-jsonrpc ${P}.new || die
#  rm -r ${P} || die
#  mv ${P}.new ${P} || die
#}

#src_compile() {
#  echo ""
#}

#src_install() {
#  distutils_src_install
#}


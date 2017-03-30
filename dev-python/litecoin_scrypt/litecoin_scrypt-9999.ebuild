# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND=""

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


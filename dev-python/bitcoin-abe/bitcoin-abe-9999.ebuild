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

IUSE="mysql postgres sqlite scrypt"

RDEPEND="mysql? ( dev-python/mysql-python )
		 postgres? ( dev-python/psycopg )
		 sqlite? ( dev-lang/python[sqlite] )
		 dev-lang/python
		 scrypt? ( dev-python/litecoin_scrypt )
		 dev-python/pycrypto"

DESCRIPTION="cryptocurrency blockchain explorer"
HOMEPAGE="https://github.com/salfter/bitcoin-abe"
LICENSE="BSD-2"
EGIT_REPO_URI="https://github.com/salfter/bitcoin-abe"
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

src_install() {
  distutils_src_install

  dodoc README.md
  dodoc README-FASTCGI.txt
  dodoc README-FIRSTBITS.txt
  dodoc README-MYSQL.txt
  dodoc README-POSTGRES.txt
  dodoc README-SQLITE.txt
  dodoc abe.conf.dist
}


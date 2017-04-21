# Copyright 2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-2 

DEPEND=""
RDEPEND=""

IUSE="mysql postgres sqlite scrypt"

RDEPEND="mysql? ( dev-python/mysql-python )
		 postgres? ( dev-python/psycopg )
		 sqlite? ( dev-lang/python[sqlite] )
		 dev-lang/python
		 scrypt? ( dev-python/litecoin_scrypt )
		 dev-python/pycrypto"

DESCRIPTION="cryptocurrency blockchain explorer"
HOMEPAGE="https://gitlab.com/salfter/bitcoin-abe"
LICENSE="BSD-2"
EGIT_REPO_URI="https://gitlab.com/salfter/bitcoin-abe.git"
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
  distutils-r1_src_install

  dodoc README.md
  dodoc README-FASTCGI.txt
  dodoc README-FIRSTBITS.txt
  dodoc README-MYSQL.txt
  dodoc README-POSTGRES.txt
  dodoc README-SQLITE.txt
  dodoc abe.conf.dist
}


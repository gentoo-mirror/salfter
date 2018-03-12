# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

COMMIT=edd422a3afabfb9e11ee609c0667e1ae73ae37ef

DESCRIPTION="BOM/component manager for KiCad"
HOMEPAGE="https://github.com/Jeff-Ciesielski/Boms-Away"
SRC_URI="https://github.com/Jeff-Ciesielski/Boms-Away/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

RDEPEND="dev-python/sqlalchemy
	 dev-python/wxpython"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S=${WORKDIR}/Boms-Away-${COMMIT}

src_prepare() {
  cp ${FILESDIR}/setup.py ${S}
  cd ${S}
  cat << EOF >>bomsaway.py

def start():
  BomsAwayApp(0).MainLoop()
EOF
  mv ${S}/bomsaway.py ${S}/boms_away/
}

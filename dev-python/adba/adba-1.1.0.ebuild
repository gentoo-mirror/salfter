# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="simple and abstract interface for anidb"
HOMEPAGE="https://github.com/pymedusa/adba"
SRC_URI="https://github.com/pymedusa/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/configparser-3.5.0
	<dev-python/configparser-4.0.0
"
DEPEND=""

src_unpack()
{
  unpack $A
  cd $S
  cp $FILESDIR/setup.py .
}
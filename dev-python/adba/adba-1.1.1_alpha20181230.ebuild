# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

GIT_COMMIT=6502307ae34286e44b28234cfbacee6df1eadf07
S=$WORKDIR/$PN-$GIT_COMMIT

inherit distutils-r1

DESCRIPTION="simple and abstract interface for anidb"
HOMEPAGE="https://github.com/pymedusa/adba"
SRC_URI="https://github.com/pymedusa/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

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
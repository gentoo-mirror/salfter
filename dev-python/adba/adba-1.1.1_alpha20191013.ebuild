# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6,7,8,9} )

GIT_COMMIT=6efeff3a6bdcb6d45a4a79f424939ade2930e5f0
S=$WORKDIR/$PN-$GIT_COMMIT

inherit distutils-r1

DESCRIPTION="simple and abstract interface for anidb"
HOMEPAGE="https://github.com/pymedusa/adba"
SRC_URI="https://github.com/pymedusa/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
"
#	>=dev-python/configparser-3.5.0[${PYTHON_USEDEP}]
#	<dev-python/configparser-4.0.0[${PYTHON_USEDEP}]

DEPEND=""

src_unpack()
{
  unpack $A
  cd $S
  cp $FILESDIR/setup.py .
}

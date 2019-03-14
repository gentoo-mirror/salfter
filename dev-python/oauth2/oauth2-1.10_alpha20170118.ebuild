# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GIT_COMMIT=6689960ca23f79eccf9a25a39e93f6540f44ca23
MY_PN=python-$PN
S=$WORKDIR/$MY_PN-$GIT_COMMIT

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy{,3} )

inherit distutils-r1

DESCRIPTION="A fully tested, abstract interface to creating OAuth clients and servers"
HOMEPAGE="https://github.com/joestump/python-oauth2"
SRC_URI="https://github.com/joestump/$MY_PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/httplib2"


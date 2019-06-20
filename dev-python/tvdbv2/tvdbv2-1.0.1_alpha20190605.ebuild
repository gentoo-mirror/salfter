# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GIT_COMMIT=bf1272c9264c280c3048e89a1920e2bf5f386284
S=$WORKDIR/$PN-$GIT_COMMIT

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="A tvdbv2 swagger python client, build using swagger codegen"
HOMEPAGE="https://github.com/pymedusa/tvdbv2"
SRC_URI="https://github.com/pymedusa/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/python-dateutil-2.7.0
	>=dev-python/requests-2.16.0
	>=dev-python/six-1.9.0"


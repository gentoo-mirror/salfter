# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{4,5,6,7,8,9} )

GIT_COMMIT=bd519b1f06fcc7c70fa94b91b9d2e38ea376bb15
S=$WORKDIR/$PN-$GIT_COMMIT

inherit distutils-r1

DESCRIPTION="Decorator to wrap a function with a memoizing callable that has TTL result"
HOMEPAGE="https://github.com/lwzm/ttl-cache"
SRC_URI="https://github.com/lwzm/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND=""


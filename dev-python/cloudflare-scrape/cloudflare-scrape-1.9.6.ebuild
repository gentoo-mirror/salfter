# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

GIT_COMMIT=2a5af1d4928b70f0cf1640564d618be51cf22332
S=$WORKDIR/$PN-$GIT_COMMIT

inherit distutils-r1

DESCRIPTION="A Python module to bypass Cloudflare's anti-bot page"
HOMEPAGE="https://github.com/pymedusa/cloudflare-scrape"
SRC_URI="https://github.com/pymedusa/${PN}/archive/$GIT_COMMIT.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.0.0
	>=dev-python/Js2Py-0.59
"
DEPEND=""


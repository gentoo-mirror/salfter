# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

GIT_COMMIT=713e3b4017442d87ad0d638f7991cc330abeee5e
S=$WORKDIR/$PN-$GIT_COMMIT

inherit distutils-r1

DESCRIPTION="A Python module to bypass Cloudflare's anti-bot page"
HOMEPAGE="https://github.com/Anorov/cloudflare-scrape"
SRC_URI="https://github.com/Anorov/${PN}/archive/$GIT_COMMIT.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.0.0
	>=dev-python/Js2Py-0.59
"
DEPEND=""


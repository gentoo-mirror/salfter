# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="A Python module to bypass Cloudflare's anti-bot page"
HOMEPAGE="https://github.com/venomous/cloudscraper"
SRC_URI="https://github.com/VeNoMouS/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.9.2
	>=dev-python/requests-toolbelt-0.9.1
"
DEPEND=""


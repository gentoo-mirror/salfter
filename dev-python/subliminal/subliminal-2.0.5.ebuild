# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Subtitles, faster than your thoughts"
HOMEPAGE="https://github.com/pymedusa/subliminal"
SRC_URI="https://github.com/pymedusa/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/guessit-2.0.1
	>=dev-python/babelfish-0.5.2
	>=dev-python/enzyme-0.4.1
	>=dev-python/beautifulsoup-4.4.0
	>=dev-python/requests-2.0
	>=dev-python/click-4.0
	>=dev-python/dogpile-cache-0.6.0
	>=dev-python/stevedore-1.0.0
	>=dev-python/chardet-2.3.0
	>=dev-python/pysrt-1.0.1
	>=dev-python/six-1.9.0
	>=dev-python/appdirs-1.3
	>=dev-python/rarfile-2.7
	>=dev-python/pytz-2012c
	>=dev-python/futures-3.2.0"

#S="${WORKDIR}/python-xapp-${PV}"

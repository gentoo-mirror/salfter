# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 python3_4 python3_5 python3_6 )

inherit distutils-r1

COMMIT=0eddc41614891c2010565a2f3bb7de395b72b74c

DESCRIPTION="bulk-edit components in a KiCad schematic or library by transferring fields to/from a spreadsheet"
HOMEPAGE="https://xesscorp.github.io/KiField/docs/_build/singlehtml/index.html"
SRC_URI="https://github.com/xesscorp/KiField/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

RDEPEND=">=dev-python/openpyxl-2.3.2
	 >=dev-python/future-0.15.0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S=${WORKDIR}/KiField-${COMMIT}


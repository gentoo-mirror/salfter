# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Git Repository Monitor"
HOMEPAGE="https://github.com/spajus/gitmon"
SRC_URI="https://github.com/spajus/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
  epatch ${FILESDIR}/${P}-no-growl.patch
}

RDEPEND="dev-python/notify-python dev-python/git-python"
DEPEND=""

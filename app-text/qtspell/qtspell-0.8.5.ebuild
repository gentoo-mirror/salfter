EAPI=6
inherit cmake-utils

DESCRIPTION="Spell checking for Qt text widgets"
HOMEPAGE="https://github.com/manisandro/qtspell"
SRC_URI="https://github.com/manisandro/${PN}/archive/${PV}.tar.gz -> $P.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="qt5"

DEPEND="app-text/enchant"


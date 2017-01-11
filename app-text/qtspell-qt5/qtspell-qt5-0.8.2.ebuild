EAPI=5
inherit cmake-utils

DESCRIPTION="Spell checking for Qt text widgets"
HOMEPAGE="https://github.com/manisandro/qtspell"
SRC_URI="https://github.com/manisandro/${PN}/releases/download/${PV}/qtspell-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/enchant"

src_unpack()
{
  unpack "${A}"
  cd "${WORKDIR}"
  mv qtspell-${PV} ${P}
  cd "${S}"
  sed -i "s/SET(USE_QT5 OFF/SET(USE_QT5 ON/" CMakeLists.txt
}

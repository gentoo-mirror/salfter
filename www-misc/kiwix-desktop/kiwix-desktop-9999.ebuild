EAPI=7

inherit qmake-utils git-r3

DESCRIPTION="cross-platform viewer/manager of ZIM files"
HOMEPAGE="https://kiwix.org/"
EGIT_REPO_URI="https://github.com/kiwix/$PN"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="www-misc/kiwix-lib
	dev-qt/qtgui:5
	dev-qt/qtcore:5
	dev-qt/qtwebengine:5
	dev-qt/qtsvg:5
	dev-qt/qtimageformats:5
	net-misc/aria2[bittorrent]"

src_compile()
{
  eqmake5 PREFIX=/usr .
  emake
}

src_install()
{
  emake install INSTALL_ROOT=$D
}

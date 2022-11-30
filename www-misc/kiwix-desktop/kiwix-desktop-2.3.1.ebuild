EAPI=8

inherit qmake-utils

DESCRIPTION="cross-platform viewer/manager of ZIM files"
HOMEPAGE="https://kiwix.org/"
SRC_URI="https://github.com/kiwix/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=www-misc/libkiwix-11
	!www-misc/kiwix-lib
	dev-qt/qtgui:5
	dev-qt/qtcore:5
	dev-qt/qtwebengine:5
	dev-qt/qtsvg:5
	dev-qt/qtimageformats:5
	net-misc/aria2[bittorrent,metalink,xmlrpc]"

src_compile()
{
  eqmake5 PREFIX=/usr .
  emake
}

src_install()
{
  emake install INSTALL_ROOT=$D
}

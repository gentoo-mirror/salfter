EAPI=7
inherit cmake

DESCRIPTION="A Gtk/Qt front-end to tesseract-ocr"
HOMEPAGE="https://github.com/manisandro/gImageReader"
SRC_URI="https://github.com/manisandro/gImageReader/releases/download/v${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="scanner qt5 gtk"

DEPEND=">=app-text/tesseract-3.04
	scanner? ( media-gfx/sane-backends )
	app-text/podofo
	virtual/jpeg
	app-text/djvu
	dev-util/intltool
	dev-libs/libzip
	sys-libs/e2fsprogs-libs
	dev-libs/libxml2
	qt5? (
	  dev-qt/qtcore:5
	  app-text/qtspell[qt5]
	  app-text/poppler
	  dev-libs/quazip	
	)"

PATCHES="$FILESDIR/$P-qurl-fix.patch"

src_configure()
{
  local mycmakeargs=(
    -DINTERFACE_TYPE="$(usev qt5) $(usev gtk)"
  )
  cmake_src_configure
}

src_install()
{
  cmake_src_install
  cd $D/usr/share/doc && mv $PN $P
}

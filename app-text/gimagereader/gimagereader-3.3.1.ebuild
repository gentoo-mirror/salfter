EAPI=7
inherit cmake

DESCRIPTION="A Gtk/Qt front-end to tesseract-ocr"
HOMEPAGE="https://github.com/manisandro/gImageReader"
SRC_URI="https://github.com/manisandro/gImageReader/releases/download/v${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="scanner qt5 gtk"
REQUIRED_USE="^^ ( qt5 gtk )"

DEPEND=">=app-text/tesseract-3.04
	scanner? ( media-gfx/sane-backends )
	app-text/podofo
	virtual/jpeg
	app-text/djvu
	dev-util/intltool
	dev-libs/libzip
	sys-libs/e2fsprogs-libs
	dev-libs/libxml2
	app-text/enchant
	qt5? (
	  app-text/qtspell
	  dev-qt/qtcore:5
	  app-text/qtspell[qt5]
	  app-text/poppler
	  <dev-libs/quazip-1	
	)
	gtk? (
	  dev-cpp/gtkmm
	  dev-cpp/gtksourceviewmm
	  dev-cpp/cairomm
	  dev-libs/json-glib
	  dev-cpp/libxmlpp
	  dev-python/pygobject
	  dev-cpp/gtkspellmm
	)"

PATCHES=(
	$FILESDIR/$P-qurl-fix.patch
	$FILESDIR/$P-cmake-fixes.patch
	)

src_configure()
{
  if use qt5
  then
    local mycmakeargs=( -DINTERFACE_TYPE=qt5 )
  fi
  if use gtk
  then
    local mycmakeargs=( -DINTERFACE_TYPE=gtk )
  fi
  cmake_src_configure
}

src_install()
{
  cmake_src_install
  cd $D/usr/share/doc && mv $PN $P
}

pkg_postinst()
{
  if use gtk
  then
    glib-compile-schemas /usr/share/glib-2.0/schemas/
  fi
}

pkg_postrm()
{
  if use gtk
  then
    glib-compile-schemas /usr/share/glib-2.0/schemas/
  fi
}

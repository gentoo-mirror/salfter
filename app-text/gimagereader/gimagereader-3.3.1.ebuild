EAPI=6
inherit cmake-utils

DESCRIPTION="A Gtk/Qt front-end to tesseract-ocr"
HOMEPAGE="https://github.com/manisandro/gImageReader"
SRC_URI="https://github.com/manisandro/gImageReader/releases/download/v${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="scanner"

DEPEND="sys-devel/gettext
	app-text/tesseract
	app-text/djvu
	app-text/podofo
	scanner? ( media-gfx/sane-backends )
	app-text/enchant
	dev-libs/quazip
	app-text/qtspell"

PATCHES="$FILESDIR/$P-qurl-fix.patch"

src_install()
{
  cmake-utils_src_install
  cd $D/usr/share/doc && mv $PN $P
}

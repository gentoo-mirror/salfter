# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit cmake-utils

DESCRIPTION="A tesseract OCR front-end"
HOMEPAGE="https://github.com/manisandro/gImageReader"
SRC_URI="https://github.com/manisandro/gImageReader/releases/download/v${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="scanner"

DEPEND=">=app-text/qtspell-0.8.0[qt5]
	>=app-text/tesseract-3.04.00
	app-text/poppler[qt5]
	scanner? ( media-gfx/sane-backends )
	app-text/podofo
	media-libs/libjpeg-turbo
	app-text/djvu"

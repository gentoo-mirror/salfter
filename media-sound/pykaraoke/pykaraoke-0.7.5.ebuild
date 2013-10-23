# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2:2.6"

inherit distutils eutils

DESCRIPTION="Python powered karaoke."
HOMEPAGE="http://kibosh.org/pykaraoke/index.php"
SRC_URI="http://prdownloads.sourceforge.net/${PN}/${P}.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+mutagen"

DEPEND="
	dev-python/pygame
	>=dev-python/wxpython-2.6
	media-libs/libsdl
	media-video/y4mscaler
	media-video/mjpegtools
"
RDEPEND="${DEPEND}
	mutagen? ( media-libs/mutagen )
"

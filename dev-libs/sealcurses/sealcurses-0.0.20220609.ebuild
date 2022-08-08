EAPI=7

inherit cmake-utils

DESCRIPTION="SDL Emulation and Adaptation Layer for Curses"
HOMEPAGE="https://git.skyjake.fi/skyjake/sealcurses"
SRC_URI="https://alfter.us/wp-content/uploads/2022/08/$P.tar.gz"
S=$WORKDIR/$PN

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="sys-libs/ncurses"

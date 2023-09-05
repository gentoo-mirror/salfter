EAPI=8

inherit meson

DESCRIPTION="Kiwix software suite core: code shared by all Kiwix ports"
HOMEPAGE="https://kiwix.org/"
SRC_URI="https://github.com/kiwix/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="net-misc/aria2[bittorrent,metalink,xmlrpc]"

DEPEND=">=app-arch/libzim-6.3.0
	dev-libs/icu
	dev-libs/pugixml
	>=dev-cpp/mustache-4.1
	net-libs/libmicrohttpd"


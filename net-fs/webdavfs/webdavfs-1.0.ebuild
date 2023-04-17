EAPI=8

inherit go-module

go-module_set_globals

DESCRIPTION="A FUSE filesystem for WebDAV shares"

LICENSE=MIT
SLOT=0
KEYWORDS=amd64
SRC_URI="
	https://github.com/miquels/$PN/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://alfter.us/wp-content/uploads/2023/04/$P-deps.tar.xz
	"
# see https://wiki.gentoo.org/wiki/Writing_go_Ebuilds for reference
RESTRICT="mirror test"

DEPEND="sys-fs/fuse"

src_compile() 
{
	ego build
}

src_install()
{
	dobin $PN
	default
}


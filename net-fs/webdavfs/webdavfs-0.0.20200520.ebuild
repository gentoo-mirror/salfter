EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/miquels"
GOLANG_PKG_VERSION="117d63347042f65f741b1914ba15c44523503dc2"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bazil/fuse:65cc252 -> bazil.org/"
	"github.com/pborman/getopt:ee0cd42"
	"github.com/golang/net:59133d7 -> golang.org/x/"
)

inherit golang-single

DESCRIPTION="A FUSE filesystem for WebDAV shares"

LICENSE=MIT
SLOT=0
KEYWORDS=amd64

GOLANG_PKG_USE_CGO=1

DEPEND="sys-fs/fuse"

src_install()
{
  golang-single_src_install
  insinto /usr/sbin
  newsbin $WORKDIR/gobin/webdavfs mount.webdavfs
}


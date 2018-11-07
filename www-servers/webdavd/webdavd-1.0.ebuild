EAPI=5

DEPEND="net-libs/libmicrohttpd"

DESCRIPTION="standalone WebDAV server"
HOMEPAGE="https://github.com/couling/WebDAV-Daemon"
LICENSE="CC-BY-4.0"
SRC_URI="https://github.com/couling/WebDAV-Daemon/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64"
S=${WORKDIR}/WebDAV-Daemon-${PV}

src_compile()
{
  emake
}

src_install()
{
  cd ${S}/build
  dosbin webdavd
  cd ..
  dodoc Configuration.md
}

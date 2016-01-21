# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="SSH public key exporter"
HOMEPAGE="http://www.catb.org/esr/sshexport/"
SRC_URI="http://www.catb.org/~esr/sshexport/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~*"
RDEPEND="dev-lang/python"

src_install()
{
  dobin sshexport
  doman sshexport.1
}

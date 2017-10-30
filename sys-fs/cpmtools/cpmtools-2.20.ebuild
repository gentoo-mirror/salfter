EAPI=5

DESCRIPTION="CP/M filesystem manipulation tools, similar to mtools"
HOMEPAGE="http://www.moria.de/~michael/cpmtools/"
SRC_URI="http://www.moria.de/~michael/cpmtools/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=${RDEPEND}

src_install()
{
  for i in cpmls cpmcp cpmrm cpmchmod cpmchattr mkfs.cpm fsck.cpm fsed.cpm
  do
    dobin $i
  done
  for i in cpm.5 cpmchattr.1 cpmchmod.1 cpmcp.1 cpmls.1 cpmrm.1 fsck.cpm.1 fsed.cpm.1 mkfs.cpm.1
  do
    doman $i
  done
  dodoc README
  dodoc COPYING
}

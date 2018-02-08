EAPI="5"

DESCRIPTION="Bminer Zcash CUDA miner"
HOMEPAGE="https://bitcointalk.org/index.php?topic=2519271.0"
SRC_URI="https://www.bminercontent.com/releases/bminer-v${PV}-e337b9a-amd64.tar.xz -> ${P}.tar.xz"

SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/bminer-v${PV}-4f20af3"

src_install() {
	dobin bminer
}

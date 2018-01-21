EAPI="5"

DESCRIPTION="EWBF Zcash CUDA miner"
HOMEPAGE="https://bitcointalk.org/index.php?topic=1707546.0"
SRC_URI="https://drive.google.com/uc?export=download&id=0B9EPp8NdigFiV1AwZW1lY2tEcjA -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PV}"

src_install() {
	newbin miner zecminer
}

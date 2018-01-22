# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools flag-o-matic versionator

DESCRIPTION="Bitcoin CPU/GPU/FPGA miner in C"
HOMEPAGE="https://bitcointalk.org/index.php?topic=28402.0"
SRC_URI="https://github.com/tpruvot/ccminer/archive/${PV}-tpruvot.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="hardened"

DEPEND="
	net-misc/curl
	dev-libs/jansson
	dev-util/nvidia-cuda-sdk
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/ccminer-${PV}-tpruvot"

src_prepare() {
	epatch $FILESDIR/ccminer.cpp.patch
	eautoreconf
}

src_configure() {
	strip-flags
	filter-flags -ggdb -pipe -m*
	append-cppflags -I/opt/cuda/include
	append-ldflags -L/opt/cuda/lib64
	use hardened && append-cppflags -nopie

	default
}

src_install() {
	newbin ccminer tpccminer
	dodoc README.txt
}

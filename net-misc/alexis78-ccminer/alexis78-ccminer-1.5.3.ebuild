# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools flag-o-matic versionator

DESCRIPTION="Multi-algorithm GPU miner"
HOMEPAGE="https://github.com/alexis78/ccminer"
SRC_URI="https://github.com/alexis78/ccminer/archive/${PV}-tpruvot.tar.gz -> ${P}.tar.gz"

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
	newbin ccminer asccminer
	dodoc README.txt
}

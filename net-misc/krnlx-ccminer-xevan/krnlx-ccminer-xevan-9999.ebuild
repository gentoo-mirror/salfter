# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools flag-o-matic versionator git-r3

DESCRIPTION="xevan GPU miner"
HOMEPAGE="https://bitcointalk.org/index.php?topic=2237852.0"
EGIT_PROJECT="krnlx-ccminer-xevan"
EGIT_REPO_URI="https://github.com/krnlx/ccminer-xevan"

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
	newbin ccminer kxccminer-xevan
	dodoc README.txt
}

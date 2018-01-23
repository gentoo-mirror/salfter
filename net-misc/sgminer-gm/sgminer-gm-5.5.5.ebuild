# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools versionator eutils

DESCRIPTION="Bitcoin CPU/GPU/FPGA miner in C"
HOMEPAGE="https://bitcointalk.org/index.php?topic=28402.0"
SRC_URI="https://github.com/genesismining/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+adl examples hardened ncurses +opencl scrypt +udev"
REQUIRED_USE="
	adl? ( opencl )
	opencl? ( ncurses )
	scrypt? ( opencl )
"

DEPEND="
	net-misc/curl
	ncurses? (
		sys-libs/ncurses
	)
	>=dev-libs/jansson-2.5
	opencl? (
		virtual/opencl
	)
	udev? (
		virtual/udev
	)
	virtual/pkgconfig
	sys-apps/sed
	adl? (
		>=x11-libs/amd-adl-sdk-6.0
	)
"

RDEPEND="${DEPEND}"

src_prepare() {
	use adl && ln -s /usr/include/ADL/* ADL_SDK/

	epatch $FILESDIR/sgminer-${PV}-system-jansson.patch
	cd ${S}
	./autogen.sh
	eautoconf -i
}

src_configure() {
	local CFLAGS="${CFLAGS}"
	use hardened && CFLAGS="${CFLAGS} -nopie"

	CFLAGS="${CFLAGS}" \
	econf \
		$(use_enable adl) \
		$(use_with ncurses curses) \
		$(use_enable opencl) \
		$(use_enable scrypt) \
		$(use_with udev libudev) \
	# sanitize directories
	sed -i 's~^\(\#define SGMINER_PREFIX \).*$~\1"'"${EPREFIX}/usr/lib/sgminer"'"~' config.h
}

src_install() {
	newbin sgminer sgminer-gm
	dodoc AUTHORS.md README.md
	if use opencl; then
		insinto /usr/lib/sgminer
		doins kernel/*.cl
		doins kernel/*.h
	fi
	if use examples; then
		docinto examples
		dodoc api-example.php miner.php API.java api-example.c
	fi
}
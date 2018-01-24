# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools versionator eutils

DESCRIPTION="NiceHash sgminer fork"
HOMEPAGE="https://github.com/nicehash/sgminer"
SRC_URI="https://github.com/nicehash/sgminer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+adl examples hardened ncurses +opencl scrypt +udev"
REQUIRED_USE="
	adl? ( opencl )
	opencl? ( ncurses )
	scrypt? ( opencl )
"

S=$WORKDIR/sgminer-$PV

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

	epatch $FILESDIR/sgminer-system-jansson.patch
	epatch $FILESDIR/sgminer-kernel-path.patch
	cd ${S}
	./autogen.sh
	eautoconf -i
}

src_configure() {
	local CFLAGS="${CFLAGS}"
	use hardened && CFLAGS="${CFLAGS} -nopie"

	CFLAGS="${CFLAGS}" \
	LT_SYS_LIBRARY_PATH=/usr/lib/${PN} \
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
	newbin sgminer sgminer-nh
	dodoc AUTHORS.md README.md
	if use opencl; then
		insinto /usr/lib/${PN}
		doins kernel/*.cl
	fi
	if use examples; then
		docinto examples
		dodoc api-example.php miner.php API.java api-example.c
	fi
}
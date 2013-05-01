# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator

MY_PV="$(replace_version_separator 3 -)"
S="${WORKDIR}/${PN}-${MY_PV}"

DESCRIPTION="Bitcoin CPU/GPU/FPGA miner in C"
HOMEPAGE="https://bitcointalk.org/index.php?topic=28402.msg1424321#msg1424321"
SRC_URI="http://ck.kolivas.org/apps/${PN}/${PN}-${MY_PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+adl bitforce examples hardened icarus modminer ncurses +opencl scrypt +udev ztex"
REQUIRED_USE='
	|| ( bitforce icarus modminer opencl ztex )
	adl? ( opencl )
	opencl? ( ncurses )
	scrypt? ( opencl )
'

DEPEND='
	net-misc/curl
	ncurses? (
		sys-libs/ncurses
	)
	dev-libs/jansson
	opencl? (
		|| (
			virtual/opencl
			virtual/opencl-sdk
			app-admin/eselect-opencl
			dev-util/ati-stream-sdk
			dev-util/ati-stream-sdk-bin
			dev-util/amdstream
			dev-util/amd-app-sdk
			dev-util/amd-app-sdk-bin
			dev-util/nvidia-cuda-sdk[opencl]
			dev-util/intel-opencl-sdk
		)
	)
	udev? (
		sys-fs/udev
	)
	ztex? (
		virtual/libusb:1
	)
'
RDEPEND="${DEPEND}"
DEPEND="${DEPEND}
	virtual/pkgconfig
	sys-apps/sed
	adl? (
		x11-libs/amd-adl-sdk
	)
"

src_prepare() {
	ln -s /usr/include/ADL/* ADL_SDK/
	epatch ${FILESDIR}
}

src_configure() {
	local CFLAGS="${CFLAGS}"
	use hardened && CFLAGS="${CFLAGS} -nopie"

	CFLAGS="${CFLAGS}" \
	econf \
		$(use_enable adl) \
		$(use_enable bitforce) \
		$(use_enable cpumining) \
		$(use_enable icarus) \
		$(use_enable modminer) \
		$(use_with ncurses curses) \
		$(use_enable opencl) \
		$(use_enable scrypt) \
		$(use_with udev libudev) \
		$(use_enable ztex)
	# sanitize directories
	sed -i 's~^\(\#define CGMINER_PREFIX \).*$~\1"'"${EPREFIX}/usr/lib/cgminer"'"~' config.h
}

src_install() {
	dobin cgminer
	dodoc AUTHORS NEWS README API-README
	if use scrypt; then
		dodoc SCRYPT-README
	fi
	if use icarus || use bitforce; then
		dodoc FPGA-README
	fi
	if use modminer; then
		insinto /usr/lib/cgminer/modminer
		doins bitstreams/*.ncd
		dodoc bitstreams/COPYING_fpgaminer
	fi
	if use opencl; then
		insinto /usr/lib/cgminer
		doins *.cl
	fi
	if use ztex; then
		insinto /usr/lib/cgminer/ztex
		doins bitstreams/*.bit
		dodoc bitstreams/COPYING_ztex
	fi
	if use examples; then
		docinto examples
		dodoc api-example.php miner.php API.java api-example.c
	fi
}

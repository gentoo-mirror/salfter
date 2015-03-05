# Copyright 2010-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

UNOBTANIUMCORE_NO_SYSLIBS=1
UNOBTANIUMCORE_IUSE=""
inherit unobtaniumcore

DESCRIPTION="Command-line JSON-RPC client specifically designed for talking to Unobtanium Core Daemon"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	virtual/bitcoin-leveldb
"

src_prepare() {
	unobtaniumcore_prepare
	sed -i 's/unobtanium-tx//' src/Makefile.am
	unobtaniumcore_autoreconf
}

src_configure() {
	unobtaniumcore_conf \
		--with-utils
}

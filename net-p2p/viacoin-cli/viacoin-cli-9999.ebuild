# Copyright 2010-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VIACOINCORE_NO_SYSLIBS=1
VIACOINCORE_IUSE=""
inherit viacoincore

DESCRIPTION="Command-line JSON-RPC client specifically designed for talking to Viacoin Core Daemon"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	virtual/bitcoin-leveldb
"

src_prepare() {
	viacoincore_prepare
	sed -i 's/viacoin-tx//' src/Makefile.am
	viacoincore_autoreconf
}

src_configure() {
	viacoincore_conf \
		--with-utils
}

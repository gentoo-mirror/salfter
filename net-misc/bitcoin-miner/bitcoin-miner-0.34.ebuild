# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="Ufasoft Bitcoin miner"
HOMEPAGE="http://ufasoft.com/open/bitcoin/"
SRC_URI="http://ufasoft.com/files/ufasoft_coin-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="dev-lang/jwasm 
	adl? (
		x11-libs/amd-adl-sdk
	)
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
	net-misc/curl"
RDEPEND="${DEPEND}"
IUSE="threads sse2 +opencl +adl"

S=${WORKDIR}/ufasoft_coin-${PV}

src_configure() {
	econf \
		$(use_enable amdapp) \
		$(use_enable opencl) \
		$(use_enable cuda) 
}

src_compile() {
	emake
}

src_install() {
	einstall
}

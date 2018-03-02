# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils cmake-utils versionator

MY_PV="$(replace_version_separator "_" ".")"
MY_PV="${MY_PV/rc/dev}"
S=$WORKDIR/${PN}-${MY_PV}
CABLE_COMMIT=41e43d44457168dcbe2e00bb86b0d000cd8d58a0

DESCRIPTION="Ethereum miner with CUDA and stratum support"
HOMEPAGE="https://github.com/ethereum-mining/ethminer"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ethereum-mining/${PN}.git"
	EGIT_SUBMODULES=()
	KEYWORDS=""
else
	SRC_URI="https://github.com/ethereum-mining/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz
	         https://github.com/ethereum/cable/archive/$CABLE_COMMIT.tar.gz -> cable-$CABLE_COMMIT.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+ LGPL-3+"
SLOT="0"
IUSE="apicore cuda dbus +opencl +stratum"

RDEPEND="
	dev-cpp/libjson-rpc-cpp[http-client]
	dev-libs/boost
	dev-libs/jsoncpp
	apicore? ( dev-cpp/libjson-rpc-cpp[tcp-socket-server] )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	dbus? ( sys-apps/dbus )
	opencl? ( virtual/opencl )
"
DEPEND="${RDEPEND}
	dbus? ( virtual/pkgconfig )
"

CMAKE_MIN_VERSION="3.3"

pkg_setup() {
	einfo
	einfo "If you have problems with finding the OpenCL library"
	einfo "please ensure that you select opencl library from"
	einfo "eselect opencl list"
	einfo
}

src_unpack() {
	unpack $P.tar.gz
	cd $S/cmake && unpack cable-$CABLE_COMMIT.tar.gz && rmdir cable && mv cable-$CABLE_COMMIT cable
}

src_configure() {
	local mycmakeargs=(
		-DAPICORE=$(usex apicore)
		-DETHASHCL=$(usex opencl)
		-DETHASHCUDA=$(usex cuda)
		-DETHDBUS=$(usex dbus)
		-DETHSTRATUM=$(usex stratum)
	)

	cmake-utils_src_configure
}

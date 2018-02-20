# $Header: $

EAPI=4

inherit git-r3 eutils

DESCRIPTION="Trezor Bridge"
HOMEPAGE="https://github.com/trezor/trezord"
EGIT_REPO_URI="https://github.com/trezor/trezord"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""

DEPEND="dev-libs/boost[static-libs]
	>=dev-libs/protobuf-3[static-libs]
	net-libs/libmicrohttpd
	virtual/libusb
	dev-util/cmake
	net-misc/curl
	virtual/pkgconfig"

src_prepare() {
	(cd ${WORKDIR}/${P}/src/config && wget https://raw.githubusercontent.com/trezor/trezor-common/master/protob/config.proto)
}

src_compile() {
	cd ${WORKDIR}/${P}
	(cd src/config/ && protoc -I/usr/include -I. --cpp_out=. config.proto)
	./build.sh
}

src_install() {
	dobin build/trezord
}

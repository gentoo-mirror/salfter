# $Header: $

EAPI=4

inherit eutils git-r3

DESCRIPTION="Trezor Bridge"
HOMEPAGE="https://github.com/trezor/trezord-go"
EGIT_REPO_URI="https://github.com/trezor/trezord-go"
EGIT_COMMIT=cabc7c7f3a7491761559c90d55f9ae7d9e443ed5
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/go"

src_prepare() {
	cd ${WORKDIR}
	mkdir -p go/src/github.com/trezor
	mv ${P} go/src/github.com/trezor/trezord-go
	mkdir ${P}
}

src_compile() {
	cd ${WORKDIR}/go/src/github.com/trezor/trezord-go
	GOPATH=${WORKDIR}/go go build
}

src_install() {
	cd ${WORKDIR}/go/src/github.com/trezor/trezord-go
	newbin trezord-go trezord
}

# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils

DESCRIPTION="Terracoin"
HOMEPAGE="https://github.com/terracoin/terracoin"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ipv6 qrcode +upnp nofee"
GITHUB_REPO="terracoin"
GITHUB_USER="terracoin"
GITHUB_TAG="v0.1.3rc3"

DEPEND="dev-libs/openssl[-bindist] \
=sys-libs/db-4.8*[cxx] \
dev-libs/boost \
upnp? ( net-libs/miniupnpc ) \
qrcode? ( media-gfx/qrencode )"
RDEPEND="${DEPEND}"
SRC_URI="https://www.github.com/${GITHUB_USER}/${GITHUB_REPO}/tarball/${GITHUB_TAG} -> ${PN}-${GITHUB_TAG}.tar.gz"

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${GITHUB_USER}-${GITHUB_REPO}"-??????? "${S}" || die
}

src_prepare() {
	if use nofee; then
	  cd ${S}
	  epatch ${FILESDIR}/zero-tx-fee.patch || die
	fi
}

src_compile() {
	cd ${S}/src
	export CXX="g++ -I /usr/include/db4.8"
	make ${MAKEOPTS} -f makefile.unix \
		USE_UPNP="$(use upnp && echo 1 || echo -)" \
		USE_IPV6="$(use ipv6 && echo 1 || echo 0)" \
		USE_QRCODE="$(use qrcode && echo 1 || echo 0)" \
	|| die
}

src_install() {
	dobin ${S}/src/terracoind
	cd ${S}/doc
	dodoc README Tor.txt assets-attribution.txt
}
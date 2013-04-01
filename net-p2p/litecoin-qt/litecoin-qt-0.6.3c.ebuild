# Distributed under the terms of the GNU General Public License v2

EAPI=4

DB_VER="4.8"

inherit db-use eutils qt4-r2 versionator

DESCRIPTION="An end-user Qt4 GUI for the Litecoin crypto-currency"
HOMEPAGE="https://github.com/litecoin-project/litecoin"
SRC_URI=""

LICENSE="MIT ISC GPL-3 LGPL-2.1 public-domain"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ipv6 qrcode upnp nofee 1stclassmsg dbus"
GITHUB_REPO="litecoin"
GITHUB_USER="litecoin-project"
GITHUB_TAG="v${PV}"

DEPEND="dev-libs/openssl[-bindist] \
sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
>=dev-libs/boost-1.41.0[threads(+)]
upnp? ( net-libs/miniupnpc ) \
	dbus? (
		dev-qt/qtdbus:4
	)
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
	emake
}

src_configure() {
	OPTS=()

	use dbus && OPTS+=("USE_DBUS=1")
	if use upnp; then
		OPTS+=("USE_UPNP=1")
	else
		OPTS+=("USE_UPNP=-")
	fi
	use qrcode && OPTS+=("USE_QRCODE=1")
	use 1stclassmsg && OPTS+=("FIRST_CLASS_MESSAGING=1")

	OPTS+=("BDB_INCLUDE_PATH=$(db_includedir "${DB_VER}")")
	OPTS+=("BDB_LIB_SUFFIX=-${DB_VER}")

	eqmake4 "${PN}.pro" "${OPTS[@]}"
}

src_install() {
	qt4-r2_src_install
	dobin ${PN}
	insinto /usr/share/pixmaps
	newins "share/pixmaps/bitcoin.ico" "${PN}.ico"
	make_desktop_entry ${PN} "Litecoin-Qt" "/usr/share/pixmaps/${PN}.ico" "Network;P2P"
}

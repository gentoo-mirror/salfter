# Copyright 2010-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DB_VER="4.8"

inherit db-use eutils versionator toolchain-funcs

MyPV="${PV/_/}"
MyPN="primecoin"
MyP="${MyPN}-${MyPV}"
S="${WORKDIR}/${MyP}xpm"

DESCRIPTION="cryptocurrency with prime-number proof of work"
HOMEPAGE="http://github.com/primecoin/primecoin"
SRC_URI="https://github.com/${MyPN}/${MyPN}/archive/v${MyPV}xpm.tar.gz -> ${MyPN}-${PV}.tar.gz
"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples ipv6 logrotate upnp"

RDEPEND="
	>=dev-libs/boost-1.41.0[threads(+)]
	dev-libs/openssl:0[-bindist]
	logrotate? (
		app-admin/logrotate
	)
	upnp? (
		net-libs/miniupnpc
	)
	sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	=dev-libs/leveldb-1.9.0*[-snappy]
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

S="${WORKDIR}/${MyP}"

pkg_setup() {
	local UG='primecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/primecoin "${UG}"
}

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/${MyP}xpm" "${WORKDIR}/${MyP}" || die
}

src_prepare() {
	if has_version '>=dev-libs/boost-1.52'; then
		sed -i 's/\(-l db_cxx\)/-l boost_chrono$(BOOST_LIB_SUFFIX) \1/' src/makefile.unix
	fi
}

src_compile() {
	OPTS=()

	OPTS+=("DEBUGFLAGS=")
	OPTS+=("CXXFLAGS=${CXXFLAGS}")
	OPTS+=("LDFLAGS=${LDFLAGS}")

	OPTS+=("BDB_INCLUDE_PATH=$(db_includedir "${DB_VER}")")
	OPTS+=("BDB_LIB_SUFFIX=-${DB_VER}")

	if use upnp; then
		OPTS+=(USE_UPNP=1)
	else
		OPTS+=(USE_UPNP=)
	fi
	use ipv6 || OPTS+=("USE_IPV6=-")

	OPTS+=("USE_SYSTEM_LEVELDB=1")

	cd src || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" ${PN}
}

src_test() {
	cd src || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" test_bitcoin
	./test_bitcoin || die 'Tests failed'
}

src_install() {
	dobin src/${PN}

	insinto /etc/primecoin
	newins "${FILESDIR}/primecoin.conf" primecoin.conf
	fowners primecoin:primecoin /etc/primecoin/primecoin.conf
	fperms 600 /etc/primecoin/primecoin.conf

	newconfd "${FILESDIR}/primecoin.confd" ${PN}
	newinitd "${FILESDIR}/primecoin.initd" ${PN}

	keepdir /var/lib/primecoin/.primecoin
	fperms 700 /var/lib/primecoin
	fowners primecoin:primecoin /var/lib/primecoin/
	fowners primecoin:primecoin /var/lib/primecoin/.primecoin
	dosym /etc/primecoin/primecoin.conf /var/lib/primecoin/.primecoin/primecoin.conf

	dodoc doc/README.md doc/release-notes.md

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,spendfrom,tidy_datadir.sh,wallettools}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/primecoind.logrotate" primecoind
	fi
}

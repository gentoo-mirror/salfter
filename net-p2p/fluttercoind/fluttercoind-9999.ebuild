# Copyright 2010-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DB_VER="4.8"

inherit db-use eutils user versionator toolchain-funcs git-2

MyPV="${PV/_/}"
MyPN="fluttercoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Fluttercoin"
HOMEPAGE="https://github.com/ofeefee/fluttercoin"
EGIT_PROJECT="fluttercoin"
EGIT_REPO_URI="https://github.com/ofeefee/fluttercoin"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS="**"
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
	local UG='fluttercoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/fluttercoin "${UG}"
}

src_prepare() {
	if has_version '>=dev-libs/boost-1.52'; then
		sed -i 's/\(-l db_cxx\)/-l boost_chrono$(BOOST_LIB_SUFFIX) \1/' src/makefile.unix
	fi

    # disable FORTIFY_SOURCE
    sed -i "s/HARDENING+=-D_FORTIFY_SOURCE=2/#HARDENING+=-D_FORTIFY_SOURCE=2/" src/makefile.unix
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
	mkdir -p obj
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix leveldb/libleveldb.a || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" ${PN}
}

src_test() {
	cd src || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" test_bitcoin
	./test_bitcoin || die 'Tests failed'
}

src_install() {
	dobin src/${PN}

	insinto /etc/fluttercoin
	newins "${FILESDIR}/fluttercoin.conf" fluttercoin.conf
	fowners fluttercoin:fluttercoin /etc/fluttercoin/fluttercoin.conf
	fperms 600 /etc/fluttercoin/fluttercoin.conf

	newconfd "${FILESDIR}/fluttercoin.confd" ${PN}
	newinitd "${FILESDIR}/fluttercoin.initd" ${PN}

	keepdir /var/lib/fluttercoin/.fluttercoin
	fperms 700 /var/lib/fluttercoin
	fowners fluttercoin:fluttercoin /var/lib/fluttercoin/
	fowners fluttercoin:fluttercoin /var/lib/fluttercoin/.fluttercoin
	dosym /etc/fluttercoin/fluttercoin.conf /var/lib/fluttercoin/.fluttercoin/fluttercoin.conf

	dodoc doc/README 

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,wallettools}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/fluttercoind.logrotate" fluttercoind
	fi
}
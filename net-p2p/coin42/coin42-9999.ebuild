# Copyright 2010-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DB_VER="4.8"

inherit db-use eutils user versionator toolchain-funcs git-r3

MyPV="${PV/_/}"
MyPN="coin42"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="42"
HOMEPAGE="https://github.com/fourtytwo42/42"
EGIT_PROJECT="coin42"
EGIT_REPO_URI="https://github.com/fourtytwo42/42"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS="~amd64"
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
	>=dev-libs/leveldb-1.9[-snappy]
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

S="${WORKDIR}/${MyP}"

pkg_setup() {
	local UG='coin42'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/coin42 "${UG}"
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
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" 42
}

src_test() {
	cd src || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" test_bitcoin
	./test_bitcoin || die 'Tests failed'
}

src_install() {
	dobin src/42

	insinto /etc/coin42
	newins "${FILESDIR}/coin42.conf" 42.conf
	fowners coin42:coin42 /etc/coin42/42.conf
	fperms 600 /etc/coin42/42.conf

	newconfd "${FILESDIR}/coin42.confd" ${PN}
	newinitd "${FILESDIR}/coin42.initd" ${PN}

	keepdir /var/lib/coin42/.42
	fperms 700 /var/lib/coin42
	fowners coin42:coin42 /var/lib/coin42/
	fowners coin42:coin42 /var/lib/coin42/.42
	dosym /etc/coin42/42.conf /var/lib/coin42/.42/42.conf

	dodoc doc/README

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,wallettools}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/coin42.logrotate" coin42d
	fi
}

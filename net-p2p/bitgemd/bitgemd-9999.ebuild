# Copyright 2010-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DB_VER="4.8"

inherit db-use eutils user versionator toolchain-funcs git-2

MyPV="${PV/_/}"
MyPN="bitgem"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Bitgem"
HOMEPAGE="https://github.com/bitgem/bitgem"
EGIT_PROJECT="bitgem"
EGIT_REPO_URI="https://github.com/bitgem/bitgem"

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
	local UG='bitgem'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/bitgem "${UG}"
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
	#emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix leveldb/libleveldb.a || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" ${PN}
}

src_test() {
	cd src || die
	emake CC="$(tc-getCC)" CXX="$(tc-getCXX)" -f makefile.unix "${OPTS[@]}" test_bitcoin
	./test_bitcoin || die 'Tests failed'
}

src_install() {
	dobin src/${PN}

	insinto /etc/bitgem
	newins "${FILESDIR}/bitgem.conf" bitgem.conf
	fowners bitgem:bitgem /etc/bitgem/bitgem.conf
	fperms 600 /etc/bitgem/bitgem.conf

	newconfd "${FILESDIR}/bitgem.confd" ${PN}
	newinitd "${FILESDIR}/bitgem.initd" ${PN}

	keepdir /var/lib/bitgem/.bitgem
	fperms 700 /var/lib/bitgem
	fowners bitgem:bitgem /var/lib/bitgem/
	fowners bitgem:bitgem /var/lib/bitgem/.bitgem
	dosym /etc/bitgem/bitgem.conf /var/lib/bitgem/.bitgem/bitgem.conf

	dodoc doc/README 

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,wallettools}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/bitgemd.logrotate" bitgemd
	fi
}

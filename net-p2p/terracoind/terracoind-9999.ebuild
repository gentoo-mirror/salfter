# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-r3 user versionator systemd

MyPV="${PV/_/}"
MyPN="terracoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Terracoin daemon & utilities"
HOMEPAGE="https://github.com/Terracoin/terracoin"
SRC_URI="
"
EGIT_PROJECT='terracoin'
EGIT_REPO_URI="https://github.com/Terracoin/terracoin"

LICENSE="MIT ISC GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="examples logrotate test upnp +wallet"

RDEPEND="
	>=dev-libs/boost-1.52.0[threads(+)]
	dev-libs/openssl:0[-bindist]
	logrotate? (
		app-admin/logrotate
	)
	upnp? (
		net-libs/miniupnpc
	)
	wallet? (
		sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]
	)
	virtual/bitcoin-leveldb
"
DEPEND="${RDEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
	dev-libs/libsecp256k1
"

pkg_setup() {
	local UG='terracoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/terracoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}/0.9.0-sys_leveldb.patch"
	epatch "${FILESDIR}/leveldbwrapper-memenv.patch"
	rm -r src/leveldb 
	eautoreconf
}

src_configure() {
	econf \
		--disable-ccache \
		$(use_with upnp miniupnpc) $(use_enable upnp upnp-default) \
		$(use_enable test tests)  \
		$(use_enable wallet)  \
		--with-system-leveldb  \
		--with-utils \
		--with-daemon \
		--without-gui \
		--without-libs \
		--disable-bench
}

src_compile() {
	emake || die
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	insinto /etc/terracoin
	newins "${FILESDIR}/terracoin.conf" terracoin.conf
	fowners terracoin:terracoin /etc/terracoin/terracoin.conf
	fperms 600 /etc/terracoin/terracoin.conf

	newconfd "${FILESDIR}/terracoin.confd" ${PN}
	newinitd "${FILESDIR}/terracoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/terracoind.service"

	keepdir /var/lib/terracoin/.terracoin
	fperms 700 /var/lib/terracoin
	fowners terracoin:terracoin /var/lib/terracoin/
	fowners terracoin:terracoin /var/lib/terracoin/.terracoin
	dosym /etc/terracoin/terracoin.conf /var/lib/terracoin/.terracoin/terracoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{terracoind.1,terracoin.conf.5,terracoin-cli.1}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/terracoind.logrotate" terracoind
	fi
}

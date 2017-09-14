# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="sexcoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Sexcoin daemon"
HOMEPAGE="https://github.com/sexcoin-project/sexcoin"
SRC_URI="
"
EGIT_PROJECT='sexcoin'
EGIT_REPO_URI="https://github.com/sexcoin-project/sexcoin"

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
	local UG='sexcoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/sexcoin "${UG}"
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
		--without-utils \
		--with-daemon \
		--without-gui \
		--without-libs
}

src_compile() {
	emake || die
	cd "${WORKDIR}/${P}/contrib/debian/manpages" && \
	  mv bitcoin.conf.5 sexcoin.conf.5 && \
	  mv bitcoind.1 sexcoind.1 && \
	  mv bitcoin-qt.1 sexcoin-qt.1 || die	
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	insinto /etc/sexcoin
	newins "${FILESDIR}/sexcoin.conf" sexcoin.conf
	fowners sexcoin:sexcoin /etc/sexcoin/sexcoin.conf
	fperms 600 /etc/sexcoin/sexcoin.conf

	newconfd "${FILESDIR}/sexcoin.confd" ${PN}
	newinitd "${FILESDIR}/sexcoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/sexcoind.service"

	keepdir /var/lib/sexcoin/.sexcoin
	fperms 700 /var/lib/sexcoin
	fowners sexcoin:sexcoin /var/lib/sexcoin/
	fowners sexcoin:sexcoin /var/lib/sexcoin/.sexcoin
	dosym /etc/sexcoin/sexcoin.conf /var/lib/sexcoin/.sexcoin/sexcoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{sexcoind.1,sexcoin.conf.5}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/sexcoind.logrotate" sexcoind
	fi
}

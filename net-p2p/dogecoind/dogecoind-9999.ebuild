# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="5.1"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="dogecoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Dogecoin"
HOMEPAGE="http://dogecoin.com/"
SRC_URI="
"
EGIT_PROJECT='dogecoin'
EGIT_REPO_URI="git://github.com/dogecoin/dogecoin.git https://github.com/dogecoin/dogecoin.git"

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
"

pkg_setup() {
	local UG='dogecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/dogecoin "${UG}"
}

src_prepare() {
	epatch "${FILESDIR}/0.9.0-sys_leveldb.patch"
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
		--without-cli \
		--with-daemon \
		--without-gui
}

src_compile() {
	emake || die
	cd "${WORKDIR}/${P}/contrib/debian/manpages" && \
	  mv bitcoin.conf.5 dogecoin.conf.5 && \
	  mv bitcoind.1 dogecoind.1 && \
	  mv bitcoin-qt.1 dogecoin-qt.1 || die	
	cd "${WORKDIR}/${P}/contrib" && \
	  mv bitcoind.bash-completion dogecoind.bash-completion || die
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	rm "${D}/usr/bin/test_dogecoin"

	insinto /etc/dogecoin
	newins "${FILESDIR}/dogecoin.conf" dogecoin.conf
	fowners dogecoin:dogecoin /etc/dogecoin/dogecoin.conf
	fperms 600 /etc/dogecoin/dogecoin.conf

	newconfd "${FILESDIR}/dogecoin.confd" ${PN}
	newinitd "${FILESDIR}/dogecoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/dogecoind.service"

	keepdir /var/lib/dogecoin/.dogecoin
	fperms 700 /var/lib/dogecoin
	fowners dogecoin:dogecoin /var/lib/dogecoin/
	fowners dogecoin:dogecoin /var/lib/dogecoin/.dogecoin
	dosym /etc/dogecoin/dogecoin.conf /var/lib/dogecoin/.dogecoin/dogecoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{dogecoind.1,dogecoin.conf.5}

	newbashcomp contrib/${PN}.bash-completion ${PN}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/dogecoind.logrotate" dogecoind
	fi
}

# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="5.1"

inherit autotools bash-completion-r1 db-use eutils git-r3 user versionator systemd

MyPV="${PV/_/}"
MyPN="joulecoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Joulecoin daemon"
HOMEPAGE="https://github.com/joulecoin/joulecoin"
SRC_URI="
"
EGIT_PROJECT='joulecoin'
EGIT_REPO_URI="https://github.com/joulecoin/joulecoin"

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
	local UG='joulecoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/joulecoin "${UG}"
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
		--without-cli \
		--with-daemon \
		--without-gui
}

src_compile() {
	emake || die
	cd "${WORKDIR}/${P}/contrib/debian/manpages" && \
	  mv bitcoin.conf.5 joulecoin.conf.5 && \
	  mv bitcoind.1 joulecoind.1 && \
	  mv bitcoin-qt.1 joulecoin-qt.1 || die	
	cd "${WORKDIR}/${P}/contrib" && \
	  mv bitcoind.bash-completion joulecoind.bash-completion || die
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	rm "${D}/usr/bin/test_joulecoin"

	insinto /etc/joulecoin
	newins "${FILESDIR}/joulecoin.conf" joulecoin.conf
	fowners joulecoin:joulecoin /etc/joulecoin/joulecoin.conf
	fperms 600 /etc/joulecoin/joulecoin.conf

	newconfd "${FILESDIR}/joulecoin.confd" ${PN}
	newinitd "${FILESDIR}/joulecoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/joulecoind.service"

	keepdir /var/lib/joulecoin/.joulecoin
	fperms 700 /var/lib/joulecoin
	fowners joulecoin:joulecoin /var/lib/joulecoin/
	fowners joulecoin:joulecoin /var/lib/joulecoin/.joulecoin
	dosym /etc/joulecoin/joulecoin.conf /var/lib/joulecoin/.joulecoin/joulecoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md

	newbashcomp contrib/${PN}.bash-completion ${PN}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/joulecoind.logrotate" joulecoind
	fi
}

# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-r3 user versionator systemd

MyPV="${PV/_/}"
MyPN="dobbscoin"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Dobbscoin daemon"
HOMEPAGE="https://github.com/dobbscoin/dobbscoin-source"
SRC_URI="
"
EGIT_PROJECT='dobbscoin'
EGIT_REPO_URI="https://github.com/dobbscoin/dobbscoin-source"

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
	local UG='dobbscoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/dobbscoin "${UG}"
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
		--without-gui
}

src_compile() {
	emake || die
}

src_test() {
	emake check
}

src_install() {
	emake DESTDIR="${D}" install

	insinto /etc/dobbscoin
	newins "${FILESDIR}/dobbscoin.conf" dobbscoin.conf
	fowners dobbscoin:dobbscoin /etc/dobbscoin/dobbscoin.conf
	fperms 600 /etc/dobbscoin/dobbscoin.conf

	newconfd "${FILESDIR}/dobbscoin.confd" ${PN}
	newinitd "${FILESDIR}/dobbscoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/dobbscoind.service"

	keepdir /var/lib/dobbscoin/.dobbscoin
	fperms 700 /var/lib/dobbscoin
	fowners dobbscoin:dobbscoin /var/lib/dobbscoin/
	fowners dobbscoin:dobbscoin /var/lib/dobbscoin/.dobbscoin
	dosym /etc/dobbscoin/dobbscoin.conf /var/lib/dobbscoin/.dobbscoin/dobbscoin.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman contrib/debian/manpages/{dobbscoind.1,dobbscoin.conf.5}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/dobbscoind.logrotate" dobbscoind
	fi
}

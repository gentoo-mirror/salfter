# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DB_VER="4.8"

inherit autotools bash-completion-r1 db-use eutils git-2 user versionator systemd

MyPV="${PV/_/}"
MyPN="digibyte"
MyP="${MyPN}-${MyPV}"

DESCRIPTION="Digibyte daemon and CLI"
HOMEPAGE="https://github.com/digibyte/digibyte"
SRC_URI="
"
EGIT_PROJECT='digibyte'
EGIT_REPO_URI="git://github.com/digibyte/digibyte.git https://github.com/digibyte/digibyte.git"

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
	local UG='digibyte'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/digibyte "${UG}"
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--disable-bench \
		--disable-ccache \
		$(use_with upnp miniupnpc) $(use_enable upnp upnp-default) \
		$(use_enable test tests)  \
		$(use_enable wallet)  \
		--with-system-leveldb  \
		--with-cli \
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

	rm "${D}/usr/bin/test_digibyte"

	insinto /etc/digibyte
	newins "${FILESDIR}/digibyte.conf" digibyte.conf
	fowners digibyte:digibyte /etc/digibyte/digibyte.conf
	fperms 600 /etc/digibyte/digibyte.conf

	newconfd "${FILESDIR}/digibyte.confd" ${PN}
	newinitd "${FILESDIR}/digibyte.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/digibyted.service"

	keepdir /var/lib/digibyte/.digibyte
	fperms 700 /var/lib/digibyte
	fowners digibyte:digibyte /var/lib/digibyte/
	fowners digibyte:digibyte /var/lib/digibyte/.digibyte
	dosym /etc/digibyte/digibyte.conf /var/lib/digibyte/.digibyte/digibyte.conf

	dodoc doc/README.md
	dodoc doc/assets-attribution.md doc/tor.md
	doman doc/man/{digibyted.1,digibyte-cli.1,digibyte-tx.1}

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,pyminer,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/digibyted.logrotate" digibyted
	fi
}

# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VIACOINCORE_IUSE="examples logrotate test upnp +wallet"
inherit bash-completion-r1 viacoincore user systemd

DESCRIPTION="Original Viacoin crypto-currency wallet for automated services"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	virtual/bitcoin-leveldb
	logrotate? (
		app-admin/logrotate
	)
"
DEPEND="${RDEPEND}"

pkg_setup() {
	local UG='viacoin'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/viacoin "${UG}"
}

src_configure() {
	# NOTE: --enable-zmq actually disables it
	viacoincore_conf \
		--with-daemon
}

src_install() {
	viacoincore_src_install

	insinto /etc/viacoin
	newins "${FILESDIR}/viacoin.conf" viacoin.conf
	fowners viacoin:viacoin /etc/viacoin/viacoin.conf
	fperms 600 /etc/viacoin/viacoin.conf

	newconfd "${FILESDIR}/viacoin.confd" ${PN}
	newinitd "${FILESDIR}/viacoin.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/viacoind.service"

	keepdir /var/lib/viacoin/.viacoin
	fperms 700 /var/lib/viacoin
	fowners viacoin:viacoin /var/lib/viacoin/
	fowners viacoin:viacoin /var/lib/viacoin/.viacoin
	dosym /etc/viacoin/viacoin.conf /var/lib/viacoin/.viacoin/viacoin.conf

	dodoc doc/assets-attribution.md doc/tor.md

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/viacoind.logrotate" viacoind
	fi
}

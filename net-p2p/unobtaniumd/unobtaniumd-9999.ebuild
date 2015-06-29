# Copyright 2010-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

UNOBTANIUMCORE_IUSE="examples logrotate test upnp +wallet"
inherit bash-completion-r1 unobtaniumcore user systemd

DESCRIPTION="Original Unobtanium crypto-currency wallet for automated services"
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
	local UG='unobtanium'
	enewgroup "${UG}"
	enewuser "${UG}" -1 -1 /var/lib/unobtanium "${UG}"
}

src_prepare()
{
	epatch "${FILESDIR}/leveldbwrapper-memenv.patch"
	eautoreconf
}

src_configure() {
	# NOTE: --enable-zmq actually disables it
	unobtaniumcore_conf \
		--with-daemon
}

src_install() {
	unobtaniumcore_src_install

	insinto /etc/unobtanium
	newins "${FILESDIR}/unobtanium.conf" unobtanium.conf
	fowners unobtanium:unobtanium /etc/unobtanium/unobtanium.conf
	fperms 600 /etc/unobtanium/unobtanium.conf

	newconfd "${FILESDIR}/unobtanium.confd" ${PN}
	newinitd "${FILESDIR}/unobtanium.initd-r1" ${PN}
	systemd_dounit "${FILESDIR}/unobtaniumd.service"

	keepdir /var/lib/unobtanium/.unobtanium
	fperms 700 /var/lib/unobtanium
	fowners unobtanium:unobtanium /var/lib/unobtanium/
	fowners unobtanium:unobtanium /var/lib/unobtanium/.unobtanium
	dosym /etc/unobtanium/unobtanium.conf /var/lib/unobtanium/.unobtanium/unobtanium.conf

	dodoc doc/assets-attribution.md doc/tor.md

	if use examples; then
		docinto examples
		dodoc -r contrib/{bitrpc,qos,spendfrom,tidy_datadir.sh}
	fi

	if use logrotate; then
		insinto /etc/logrotate.d
		newins "${FILESDIR}/unobtaniumd.logrotate" unobtaniumd
	fi
}

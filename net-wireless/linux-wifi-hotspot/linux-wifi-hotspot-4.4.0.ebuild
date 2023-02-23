EAPI=8

#inherit cmake

DESCRIPTION="Feature-rich wifi hotspot creator for Linux which provides both GUI and command-line interface"
HOMEPAGE="https://github.com/lakinduakash/linux-wifi-hotspot"
SRC_URI="https://github.com/lakinduakash/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
LICENSE="BSD-2"
SLOT=0
KEYWORDS="amd64"
S=$WORKDIR/$P

RDEPEND="net-firewall/iptables
	 net-wireless/hostapd
	 net-dns/dnsmasq
	 sys-apps/iproute2"


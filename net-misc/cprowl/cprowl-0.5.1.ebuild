# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils toolchain-funcs

DESCRIPTION="command-line tool to send Prowl notifications to iOS devices"
HOMEPAGE="https://github.com/rphillips/cprowl/"
SRC_URI="https://github.com/downloads/rphillips/cprowl/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="
        net-misc/curl[ssl]
"
RDEPEND="${DEPEND}"

src_configure() {
        ./waf --prefix="${D}/usr" configure
}

src_compile() {
        ./waf
}

src_install() {
        ./waf install
}

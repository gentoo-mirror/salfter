# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{7,8,9,10} pypy3)

inherit distutils-r1

MY_PN="${PN}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="server side counterpart of SockJS-client browser library running on top of Tornado framework"
HOMEPAGE="http://github.com/mrjoes/sockjs-tornado/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=">=www-servers/tornado-2.1.1"
DEPEND=""


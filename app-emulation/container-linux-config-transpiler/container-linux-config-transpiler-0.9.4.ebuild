# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit golang-build

DESCRIPTION="Container Linux Config Transpiler"
EGO_PN="${PN}"
SRC_URI="https://github.com/kinvolk/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/kinvolk/container-linux-config-transpiler"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/go:0"
RDEPEND=""

src_compile()
{
  emake
}

src_install()
{
  dobin $S/bin/ct
}

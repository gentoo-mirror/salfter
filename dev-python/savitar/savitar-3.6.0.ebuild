# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )
inherit cmake-utils python-single-r1

MY_PN=libSavitar

DESCRIPTION="a C++ implementation of 3MF loading with SIP Python bindings"
HOMEPAGE="https://github.com/Ultimaker/libSavitar"
SRC_URI="https://github.com/Ultimaker/${MY_PN}/archive/$PV.tar.gz -> ${P}.tar.gz"
PATCHES="$FILESDIR/use-system-pugixml.patch"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND="dev-python/sip"
DEPEND="dev-libs/pugixml"
S="$WORKDIR/$MY_PN-$PV"

src_unpack() {
	unpack $P.tar.gz
	cd $S
	rm -r pugixml
}

src_configure() {
	local mycmakeargs=(
		-DPYTHON_SITE_PACKAGES_DIR="$(python_get_sitedir)" )
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
	if use doc; then
		cmake-utils_src_compile doc
		DOCS+=( html )
	fi
}

src_test() {
	emake -C "${BUILD_DIR}" tests
}

src_install() {
	cmake-utils_src_install
	python_optimize "${D}usr/$(get_libdir)"
}

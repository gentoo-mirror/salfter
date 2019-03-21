# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cmake-utils

MY_PN=CuraEngine
MY_PV=${PV/_beta}

STB_GIT_COMMIT=2c2908f50515dcd939f24be261c3ccbcd277bb49

DESCRIPTION="A 3D model slicing engine for 3D printing"
HOMEPAGE="https://github.com/Ultimaker/CuraEngine"
SRC_URI="https://github.com/Ultimaker/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz
	 https://github.com/nothings/stb/archive/${STB_GIT_COMMIT}.tar.gz -> $P-stb.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc test"

RDEPEND="${PYTHON_DEPS}
	dev-libs/libarcus:=
	>=dev-libs/protobuf-3"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen
	       media-gfx/graphviz )
	test? ( dev-util/cppunit )"

S="${WORKDIR}/${MY_PN}-${MY_PV}"
DOCS=( "README.md" )

PATCHES=$FILESDIR/$P-build-fix.patch

src_configure() {
	local mycmakeargs=( "-DBUILD_TESTS=$(usex test ON OFF)" )
	cmake-utils_src_configure
	cd $WORKDIR/${P}_build
	tar xf $DISTDIR/$P-stb.tar.gz
	mv stb-${STB_GIT_COMMIT} stb
}

src_compile() {
	cmake-utils_src_make
	if use doc; then
		doxygen || die
		mv docs/html . || die
		find html -name '*.md5' -or -name '*.map' -delete || die
		HTML_DOCS=( html/. )
	fi
}

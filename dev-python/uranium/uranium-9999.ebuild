# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )
inherit cmake-utils python-single-r1 git-r3

MY_PN=Uranium
MY_PV=${PV/_beta}

DESCRIPTION="A Python framework for building 3D printing related applications"
HOMEPAGE="https://github.com/Ultimaker/Uranium"
EGIT_REPO_URI="https://github.com/Ultimaker/${MY_PN}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

RDEPEND="${PYTHON_DEPS}
	~dev-libs/libarcus-${PV}:*[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP},declarative,network,svg]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-qt/qtdeclarative:5
	dev-qt/qtquickcontrols:5"
DEPEND="${RDEPEND}
	sys-devel/gettext
	doc? ( app-doc/doxygen )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
PATCHES=( "${FILESDIR}/${PN}-3.2.1-fix-install-paths.patch" )
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DOCS=( README.md )

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

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{5,6} )
inherit cmake-utils fdo-mime gnome2-utils python-single-r1 git-r3

MY_PN=Cura
MY_PV=${PV/_beta}

DESCRIPTION="A 3D model slicing application for 3D printing"
HOMEPAGE="https://github.com/Ultimaker/Cura"
SRC_URI="https://github.com/Ultimaker/fdm_materials/archive/3.2.1.tar.gz -> ${PN}_fdm_materials-3.2.1.tar.gz"
EGIT_REPO_URI="https://github.com/Ultimaker/${MY_PN}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="+usb"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	~dev-libs/libarcus-${PV}:=[python,${PYTHON_USEDEP}]
	~dev-python/uranium-${PV}[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	usb? ( dev-python/pyserial[${PYTHON_USEDEP}] )
	~media-gfx/curaengine-${PV}"
DEPEND="${RDEPEND}
	sys-devel/gettext"

PATCHES=( "${FILESDIR}/${PN}-3.2.1-fix-install-paths.patch" )
DOCS=( README.md )

src_unpack() {
	git-r3_checkout
	unpack ${A}
}

src_configure() {
	local mycmakeargs=(
		-DPYTHON_SITE_PACKAGES_DIR="$(python_get_sitedir)" )
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	doicon icons/*.png
	python_optimize "${D}${get_libdir}"
	insinto /usr/share/${PN}/resources/materials
	for i in $WORKDIR/fdm_materials-3.2.1/*.xml.fdm_material
	do
		doins $i
	done
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

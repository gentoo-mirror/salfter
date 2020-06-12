EAPI=7
inherit eutils toolchain-funcs cmake-utils

DESCRIPTION="The notorious fortune program"
HOMEPAGE="http://www.shlomifish.org/open-source/projects/fortune-mod/"
SRC_URI="http://www.shlomifish.org/open-source/projects/fortune-mod/arcs/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="offensive"

DEPEND="app-text/recode
	dev-libs/rinutils"

src_prepare() {
	# null out selected categories
	for i in $FORTUNE_DELETE
	do
		find $S/datfiles $S/datfiles/off/unrotated -name $i -exec truncate -s 0 \{} \;
	done

	# fix install paths
	cd $S
	sed -i "s/\"games\"/\"bin\"/;s/\/games\//\//" CMakeLists.txt
	sed -i "s/LOCALDIR/COOKIEDIR/" datfiles/CMakeLists.txt
	sed -i "s/LOCALODIR/OCOOKIEDIR/" datfiles/off/CMakeLists.txt

	cmake-utils_src_prepare 
}

src_configure() {
	local mycmakeargs=(
		-DNO_OFFENSIVE=$(usex offensive)
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_make
}

src_install() {
	cmake-utils_src_install
	dodoc ChangeLog INDEX Notes Offensive README TODO cookie-files
}

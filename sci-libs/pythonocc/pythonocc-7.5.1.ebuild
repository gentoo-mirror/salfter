EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9,10} )
inherit python-single-r1 cmake-utils

DESCRIPTION="An industrial strength 3D python package for CAD/BIM/PLM/CAM"
HOMEPAGE="http://www.pythonocc.org/"
SRC_URI="https://github.com/tpaviot/$PN-core/archive/$PV.tar.gz -> $P.tar.gz"
LICENSE=LGPL-3
SLOT=0
KEYWORDS=~amd64
S=$WORKDIR/$PN-core-$PV

IUSE="python_single_target_python_3_9 python_single_target_python_3_8 python_single_target_python_3_7 python_single_target_python_3_6"

REQUIRED_USE="$PYTHON_REQUIRED_USE"

RDEPEND=">=sci-libs/opencascade-7.4.0
	<sci-libs/opencascade-7.5.0
	 $PYTHON_DEPS"
DEPEND="${RDEPEND}
	>=dev-lang/swig-3.0.9"

src_configure() {
	# force the correct Python to be used, not just the newest
	local mycmakeargs=(
		$(usex python_single_target_python3_9 -DPython3_EXECUTABLE=/usr/bin/python3.9 "")
		$(usex python_single_target_python3_8 -DPython3_EXECUTABLE=/usr/bin/python3.8 "")
		$(usex python_single_target_python3_7 -DPython3_EXECUTABLE=/usr/bin/python3.7 "")
		$(usex python_single_target_python3_6 -DPython3_EXECUTABLE=/usr/bin/python3.6 "")
	)
	cmake-utils_src_configure
}


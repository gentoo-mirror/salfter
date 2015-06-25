EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python interface to the SANE scanner and frame grabber"
HOMEPAGE="https://github.com/python-pillow/Sane"
SRC_URI="https://github.com/python-pillow/Sane/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-gfx/sane-backends"
DEPEND="${RDEPEND}"

src_unpack()
{
	unpack ${A}
	cd ${WORKDIR}
	mv Sane-${PV} ${P}
}

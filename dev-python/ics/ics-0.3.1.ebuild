EAPI=5

inherit distutils

SRC_URI="https://github.com/C4ptainCrunch/ics.py/archive/v0.3.1.tar.gz -> ${P}.tar.gz"

RDEPEND="dev-python/arrow"
SUPPORT_PYTHON_ABIS="1"

DESCRIPTION="Pythonic and easy iCalendar library (rfc5545)"
HOMEPAGE="http://icspy.readthedocs.org/"
LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
S="${WORKDIR}/ics.py-${PV}"



EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-r3

DEPEND="dev-python/pyusb"
RDEPEND=""

DESCRIPTION="Python interface for Coldtears LCD module"
HOMEPAGE="https://github.com/dangardner/pylcdsysinfo/"
LICENSE="GPL-3"

EGIT_REPO_URI="https://github.com/dangardner/pylcdsysinfo/"
SLOT="0"
KEYWORDS="~amd64 ~x86"



EAPI=3

inherit distutils git-2

DEPEND="dev-python/pyusb"
RDEPEND=""

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
#RESTRICT_PYTHON_ABIS="3.*"

DESCRIPTION="Python interface for Coldtears LCD module"
HOMEPAGE="https://github.com/dangardner/pylcdsysinfo/"
LICENSE="GPL-3"

EGIT_REPO_URI="https://github.com/dangardner/pylcdsysinfo/"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#src_prepare() {
#  cd ${WORKDIR} || die
#  mv ${P}/python-jsonrpc ${P}.new || die
#  rm -r ${P} || die
#  mv ${P}.new ${P} || die
#}

#src_compile() {
#  echo ""
#}

#src_install() {
#  distutils_src_install
#}


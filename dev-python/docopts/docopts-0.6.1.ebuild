EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6})

inherit distutils-r1

S=$WORKDIR/$P-fix2

DESCRIPTION="shell interface for docopt, the CLI description language"
HOMEPAGE="https://pypi.org/project/docopts/"
SRC_URI="mirror://pypi/${PN:0:1}/$PN/$PN-$PV-fix2.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="=dev-python/docopt-0.6.1"
DEPEND=""

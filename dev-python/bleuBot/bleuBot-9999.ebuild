EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit distutils-r1 git-r3 

DEPEND=""
RDEPEND="dev-python/pycurl"

DESCRIPTION="Python binding for the BleuTrade altcoin-trading API"
HOMEPAGE="https://github.com/Durendal/bleuBot"
LICENSE="MIT"
EGIT_REPO_URI="https://github.com/Durendal/bleuBot"
SLOT="0"
KEYWORDS="~amd64"


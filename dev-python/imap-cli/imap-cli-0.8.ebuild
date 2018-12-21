EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6})

inherit distutils-r1

GIT_COMMIT=1884aa58eb45713005b4f96d2d2df7f5fabd9ef2
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="Command line interface for imap account"
HOMEPAGE="https://pypi.org/project/Imap-CLI/"
SRC_URI="https://github.com/Gentux/$PN/archive/$GIT_COMMIT.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/docopts-0.6
	 >=dev-python/mock-1.0.1"
DEPEND=""

DOCS=( README.md config-example.ini )

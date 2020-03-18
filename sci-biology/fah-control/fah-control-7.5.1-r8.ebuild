EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

GIT_COMMIT=eafc04165efe19f08ffe5e8e044c5da977e3364e

DESCRIPTION="Folding@home Client Advanced Control GUI"
HOMEPAGE="https://www.foldingathome.org/"
SRC_URI="https://github.com/FoldingAtHome/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
S=$WORKDIR/$PN-$GIT_COMMIT
RDEPEND="dev-python/pygtk
	 <dev-python/pygtk-3"

src_install()
{
  distutils-r1_src_install
  echo version=\'7.5.1\' > $D/usr/lib64/python2.7/site-packages/fah/Version.py
  EPYTHON=python2.7 python_optimize
}


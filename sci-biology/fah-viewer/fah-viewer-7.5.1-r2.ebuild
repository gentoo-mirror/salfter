EAPI=7

PYTHON_COMPAT=( python2_7 )
inherit python-any-r1 scons-utils toolchain-funcs

GIT_COMMIT=8d9062530dcdba101eb768f1af1cb90f232d7f0f

DESCRIPTION="Folding@home 3D Viewer"
HOMEPAGE="https://www.foldingathome.org/"
SRC_URI="https://github.com/FoldingAtHome/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/CauldronDevelopmentLLC/cbang/archive/1.3.3.tar.gz -> cbang-1.3.3.tar.gz
	 https://github.com/FoldingAtHome/fah-client-version/archive/fah-client-7.5.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
S=$WORKDIR/$PN-$GIT_COMMIT

#PATCHES="$FILESDIR/$PN-build-python3.patch"

src_unpack()
{
  cd $WORKDIR
  unpack $P.tar.gz
  mv $GIT_COMMIT $PN-$GIT_COMMIT
  unpack cbang-1.3.3.tar.gz
  unpack fah-client-7.5.1.tar.gz
}

src_compile()
{
  cd $WORKDIR/cbang-1.3.3
  escons CC="$(tc-getCC)"
  cd $S
  BUILD_ROOT=$S \
  CBANG_HOME=../cbang-1.3.3 \
  FAH_VIEWER_HOME=$BUILD_ROOT/fah-viewer \
  FAH_CLIENT_VERSION_HOME=../fah-client-version-fah-client-7.5.1 \
  escons CC="$(tc-getCC)"
}

src_install()
{
  dobin $S/FAHViewer
}
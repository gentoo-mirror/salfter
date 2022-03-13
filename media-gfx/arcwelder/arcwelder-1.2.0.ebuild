EAPI=7

inherit cmake-utils

DESCRIPTION="3D printer anti-stutter tool"
HOMEPAGE="https://github.com/FormerLurker/ArcWelderLib"

SRC_URI="https://github.com/FormerLurker/ArcWelderLib/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"
LICENSE=AGPL-3
SLOT=0
KEYWORDS=amd64
S=$WORKDIR/ArcWelderLib-$PV

src_install()
{
  dobin $WORKDIR/${P}_build/ArcWelderConsole/ArcWelder
  dobin $WORKDIR/${P}_build/ArcWelderInverseProcessor/ArcStraightener
}

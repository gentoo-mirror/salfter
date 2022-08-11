EAPI=8

inherit cmake

DESCRIPTION="3D printer anti-stutter tool"
HOMEPAGE="https://github.com/FormerLurker/ArcWelderLib"

GIT_COMMIT=0cb60875b90c7a87b8ec9ba3b213a49b2b08ddc6
SRC_URI="https://github.com/FormerLurker/ArcWelderLib/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=AGPL-3
SLOT=0
KEYWORDS=amd64
S=$WORKDIR/ArcWelderLib-$GIT_COMMIT

src_install()
{
  dobin ${S}_build/ArcWelderConsole/ArcWelder
  dobin ${S}_build/ArcWelderInverseProcessor/ArcStraightener
}

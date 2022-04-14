EAPI=8

GIT_COMMIT=f9eb66df30c2ac11ad64f007ffd20c376c3cb93b
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="Altium to KiCad converter for PCB and schematics"
HOMEPAGE="https://github.com/thesourcerer8/altium2kicad"
SRC_URI="https://github.com/thesourcerer8/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=GPL-2
SLOT=0
KEYWORDS=amd64

RDEPEND="dev-perl/Math-Bezier
	 dev-perl/Math-Geometry-Planar"

src_install()
{
  dobin unpack.pl
  dobin convertschema.pl
  dobin convertpcb.pl
}
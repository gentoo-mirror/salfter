EAPI=6

GIT_COMMIT=52bc95d85910750daa57bd96fa1930e7f815fce8
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="Altium to KiCad converter for PCB and schematics"
HOMEPAGE="https://github.com/thesourcerer8/altium2kicad"
SRC_URI="https://github.com/thesourcerer8/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
LICENSE=GPL-2
SLOT=0
KEYWORDS=~amd64

RDEPEND="dev-perl/Math-Bezier
	 dev-perl/Math-Geometry-Planar"

src_install()
{
  dobin unpack.pl
  dobin convertschema.pl
  dobin convertpcb.pl
}
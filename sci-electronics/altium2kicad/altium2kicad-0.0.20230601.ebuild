EAPI=8

GIT_COMMIT=d4dd7107447298d78cbb9aed55b14507a8c3b83d
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
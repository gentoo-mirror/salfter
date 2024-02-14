EAPI=8
DESCRIPTION="BrutalDeluxe's Cadius disk imaging utility, with some maintenance and *nix support"
HOMEPAGE=http://brutaldeluxe.fr/products/crossdevtools/cadius/index.html
SRC_URI="https://github.com/mach-kernel/$PN/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"
LICENSE=GPL-3
SLOT=0
KEYWORDS="amd64"

src_install()
{
  dobin bin/release/cadius
}

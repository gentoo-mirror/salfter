EAPI=7

inherit go-module

DESCRIPTION="Butane translates human-readable Butane Configs into machine-readable Ignition Configs"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
SRC_URI="https://github.com/coreos/butane/archive/refs/tags/v0.16.0.tar.gz -> $P.tar.gz"
PATCHES="$FILESDIR/$P-build-fix.patch"

src_compile()
{
	cd $S && ./build
}

src_install()
{
	dobin $S/bin/*/butane
}

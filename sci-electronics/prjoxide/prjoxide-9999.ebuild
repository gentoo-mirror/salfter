EAPI=8

inherit cargo toolchain-funcs git-r3

S=$WORKDIR/$P/libprjoxide

DESCRIPTION="documenting Lattice's 28nm Nexus FPGAs"
HOMEPAGE="https://github.com/gatecat/prjoxide"
EGIT_REPO_URI="https://github.com/gatecat/prjoxide"
LICENSE=ISC
SLOT=0
KEYWORDS=

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install --path prjoxide
}

EAPI=8

inherit cmake git-r3

GIT_COMMIT=92345b77edf775fe5668700dd9931e19db2d36b0
S=$WORKDIR/$P/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
EGIT_REPO_URI=https://github.com/YosysHQ/$PN
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-vcs/git
	dev-libs/boost"

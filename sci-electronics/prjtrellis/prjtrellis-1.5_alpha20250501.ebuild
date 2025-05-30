EAPI=8

inherit cmake git-r3

GIT_COMMIT=f98e72e4963d9c9da57620595282e58d46a045f7
S=$WORKDIR/$P/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
EGIT_REPO_URI=https://github.com/YosysHQ/$PN
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-vcs/git
	dev-libs/boost"

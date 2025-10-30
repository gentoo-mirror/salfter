EAPI=8

inherit cmake git-r3

GIT_COMMIT=73bd411731808d80ead650bbc9840d9e02911e9e
S=$WORKDIR/$P/libtrellis

DESCRIPTION="reverse-engineered tools for Lattice ECP5 FPGAs"
HOMEPAGE="https://prjtrellis.readthedocs.io"
EGIT_REPO_URI=https://github.com/YosysHQ/$PN
LICENSE=ISC
SLOT=0
KEYWORDS=amd64

DEPEND="dev-vcs/git
	dev-libs/boost"

EAPI=6

inherit cmake-utils

DESCRIPTION="implementation of the 3D Manufacturing Format file standard"
HOMEPAGE="http://3mf.io/"
SRC_URI="https://github.com/3MFConsortium/$PN/archive/v$PV.tar.gz -> $P.tar.gz"
LICENSE=BSD
SLOT=0
KEYWORDS=~amd64
DEPEND=">=dev-cpp/gtest-1.8.0"
PATCHES="$FILESDIR/$PN-system-gtest.patch"

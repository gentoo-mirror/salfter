EAPI=6

inherit cmake-utils

GIT_COMMIT=ff914b9fae76cd6a365952728f44f8d79a9f8f75
GOOGLETEST_GIT_COMMIT=dccc2d67547a5a3a97e4f211f39df931c6fbd5d5
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="implementation of the 3D Manufacturing Format file standard"
HOMEPAGE="http://3mf.io/"
SRC_URI="https://github.com/3MFConsortium/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz
	 https://github.com/google/googletest/archive/$GOOGLETEST_GIT_COMMIT.tar.gz -> googletest-$GOOGLETEST_GIT_COMMIT.tar.gz"
LICENSE=BSD
SLOT=0
KEYWORDS=~amd64

src_prepare() {
#	unpack $P.tar.gz
	unpack googletest-$GOOGLETEST_GIT_COMMIT.tar.gz
	rmdir $S/UnitTests/googletest
	mv $WORKDIR/googletest-$GOOGLETEST_GIT_COMMIT $S/UnitTests/googletest
	default
}

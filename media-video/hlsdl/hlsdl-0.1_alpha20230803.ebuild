EAPI=8

GIT_COMMIT=42dcfa401deedbdc1af22ae9e5a8965563a6583b
S=$WORKDIR/$PN-$GIT_COMMIT

DESCRIPTION="C program to download VoD HLS (.m3u8) files"
HOMEPAGE="https://github.com/selsta/hlsdl"
SRC_URI="https://github.com/selsta/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE=MIT
SLOT=0
KEYWORDS=amd64

DEPEND="net-misc/curl
	dev-libs/openssl"

src_install()
{
	dobin $S/hlsdl
}

# found this at
# https://stackoverflow.com/questions/16132088/how-to-decrypt-aes-128-encrypted-m3u8-video-files?noredirect=1,
# where I had posted a hacky shell-script-based solution to the same problem

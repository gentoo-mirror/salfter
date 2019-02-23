EAPI=6

inherit eutils git-r3

DESCRIPTION="flash programming utility for Atmel's SAM family of flash-based ARM microcontrollers"
EGIT_REPO_URI=https://github.com/shumatech/BOSSA
EGIT_BRANCH=arduino
EGIT_COMMIT=5cae9fee241bd3c95c197b2464e9b83240994c43

LICENSE=BSD
SLOT=0
KEYWORDS="~arm64 ~amd64"

src_compile()
{
	emake bin/bossac
}

src_install()
{
	dobin bin/bossac
}

EAPI=8
DESCRIPTION="a port of mp3gain that also works with .m4a files"
HOMEPAGE=https://github.com/dgilman/aacgain
SRC_URI=https://alfter.us/wp-content/uploads/2024/02/$P.tar.xz
LICENSE=GPL-2
SLOT=0
KEYWORDS="amd64"

#inherit cmake

# working around the author's janky use of cmake that doesn't play well
# with cmake.eclass

src_configure()
{
  cmake .
}

src_compile()
{
  emake
}

src_install()
{
  dobin aacgain/aacgain
}

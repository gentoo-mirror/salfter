EAPI=7

DESCRIPTION="S3 library, forked for Bacula"
HOMEPAGE=https://www.bacula.org/
SRC_URI=https://www.bacula.org/downloads/$P.tar.gz
LICENSE=LGPL-3
SLOT=0
KEYWORDS=amd64

PATCHES=( $FILESDIR/$PN-makefile.patch )

src_install()
{
  emake DESTDIR=$D/usr LIBDIR=$D/usr/lib64 install || die
}

EAPI=5
GCONF_DEBUG=no

inherit multilib-minimal

DESCRIPTION="C++ bindings for gtkspell"
HOMEPAGE=http://gtkspell.sourceforge.net/
SRC_URI="mirror://sourceforge/project/gtkspell/$PN/$P.tar.xz"

LICENSE=GPL-2+
SLOT=0
KEYWORDS=amd64

RDEPEND=
DEPEND="
	>=app-text/gtkspell-3.0.5
       "

IUSE=doc

multilib_src_configure() 
{
	ECONF_SOURCE="${S}" default_src_configure \
		--disable-tests \
		$(multilib_native_use_enable doc documentation)
}


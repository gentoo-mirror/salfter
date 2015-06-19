# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit apache-module
inherit subversion
inherit autotools

DESCRIPTION="Active Directory authentication via NTLM for Apache"
HOMEPAGE="http://adldap.sourceforge.net/wiki/doku.php?id=mod_auth_ntlm_winbind"
ESVN_REPO_URI="svn://svnanon.samba.org/lorikeet/trunk/mod_auth_ntlm_winbind"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

APXS2_ARGS="-DAPACHE2 -c ${PN}.c"
APACHE2_MOD_DEFINE="AUTH_NTLM_WINBIND"
APACHE2_MOD_CONF="44_${PN}"

need_apache2_2

src_prepare() {
  eautoconf
}

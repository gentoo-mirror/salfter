# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2:2.7"
SUPPORT_PYTHON_ABIS="1"

inherit python git-2

DESCRIPTION="Bitmessage is a P2P communications protocol used to send encrypted messages to another person or to many subscribers."
HOMEPAGE="https://bitmessage.org"
EGIT_REPO_URI="https://github.com/Bitmessage/PyBitmessage.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/python[sqlite]
        dev-python/PyQt4
        dev-libs/openssl"

RESTRICT_PYTHON_ABIS="3.*"

src_compile () {
        einfo "Nothing to compile"
}
 
src_install () {
        
        installation() {
                
                dodir /usr/share/"${PN}"/
                cp -R * "${D}"/usr/share/"${PN}"/ || die
                
                #add shebang
                sed -e '1i#!/usr/bin/env python' -i "${D}"/usr/share/"${PN}"/src/bitmessagemain.py || die
                
                dodir /usr/bin/
                dosym /usr/share/"${PN}"/src/bitmessagemain.py /usr/bin/bitmessage-${PYTHON_ABI} || die

        }
         
        python_execute_function installation

        python_generate_wrapper_scripts "${D}"/usr/bin/bitmessage
}

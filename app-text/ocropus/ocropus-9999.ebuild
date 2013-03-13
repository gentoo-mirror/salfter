# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

EHG_REPO_URI="https://code.google.com/p/ocropus/"
inherit mercurial
inherit eutils
inherit distutils-r1

DESCRIPTION="open-source document analysis and OCR"
HOMEPAGE="https://code.google.com/p/ocropus/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="dev-python/matplotlib
        dev-python/pytables
        dev-python/pythonmagick
        media-libs/opencv
        net-misc/curl
        sci-libs/scipy
        www-client/firefox"

src_prepare()
{
	cd ${WORKDIR}/${P} || die
	epatch ${FILESDIR}/${PN}-install.patch || die

	# fetch models from source 
	einfo "Fetching OCR models ..."
	cd ${WORKDIR}/${P}/ocropy || die
	python2 setup.py download_models || die

	# move source directory to expected location
	einfo "Moving source directory ..."
	cd ${WORKDIR} || die
	mv ${P}/ocropy ${P}.new || die
	rm -r ${P} || die
	mv ${P}.new ${P} || die	
}

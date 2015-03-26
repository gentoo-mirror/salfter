# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

EGIT_PROJECT="ocropy"
EGIT_REPO_URI="https://github.com/tmbdev/ocropy"
inherit git-2 eutils distutils-r1

DESCRIPTION="open-source document analysis and OCR"
HOMEPAGE="https://github.com/tmbdev/ocropy"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="dev-python/pycurl
        sci-libs/scipy
        dev-python/matplotlib
        dev-python/pytables
        www-client/firefox
        dev-python/pythonmagick
        media-libs/opencv[python]
        dev-python/beautifulsoup:4"

src_prepare()
{
	cd ${WORKDIR}/${P} || die

	# fetch models from source 
	einfo "Fetching OCR models ..."
	cd ${WORKDIR}/${P}/models || die
	wget http://www.tmbdev.net/en-default.pyrnn.gz || die
}

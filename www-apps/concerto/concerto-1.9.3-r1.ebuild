# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php

DESCRIPTION="Concerto Digital Signage"
HOMEPAGE="http://www.concerto-signage.com/"
SRC_URI="http://www.concerto-signage.com/downloads/${PN}-${PV}-NoCAS.tar.gz"

S="${WORKDIR}/${PN}-${PV}-NoCAS"

LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="mysql curl gd gd-external truetype squish"

EAPI="2"
DEPEND="dev-db/mysql 
	app-text/ghostscript-gpl 
	media-gfx/imagemagick[gs,jpeg,png,tiff] 
	|| ( app-office/libreoffice-bin app-office/openoffice-bin )"
RDEPEND=""

need_httpd_cgi
need_php5_httpd

pkg_setup() {
  webapp_pkg_setup
  if ! PHPCHECKNODIE="yes" require_php_with_use mysql curl truetype || \
	( ! PHPCHECKNODIE="yes" require_php_with_any_use gd gd-external ); then
	eerror
	eerror "${PHP_PKG} needs to be reinstalled with these USE flags:"
	eerror "- mysql"
	eerror "- curl"
	eerror "- truetype"
	eerror "- either gd or gd-external"
	die "Reinstall ${PHP_PKG}."
  fi
}

src_unpack() {
  unpack ${A}
  epatch "${FILESDIR}/${P}-multipage-upload.patch"
  epatch "${FILESDIR}/${P}-password-change-fix.patch"
  epatch "${FILESDIR}/${P}-no-subversion.patch"
  if has_version app-office/libreoffice-bin; then
    epatch "${FILESDIR}/${P}-use-libreoffice-bin.patch"
  else
    epatch "${FILESDIR}/${P}-use-openoffice-bin.patch"
  fi
  if use squish; then
    epatch "${FILESDIR}/${P}-image-squish.patch"
  fi
  cd "${S}"
}

src_install() {
  webapp_src_preinst

  dodoc LICENSE
  rm -f LICENSE
  dodoc README
  rm -f README
  docinto install
  dodoc install/*

  insinto "${MY_HTDOCSDIR}"
  doins -r .

  elog "Read the instructions in /usr/share/doc/${PN}-${PV}/install/INSTALL.bz2 to complete the installation."
  elog "Concerto requires the PHP short_open_tag option to be enabled."
  webapp_src_install  
}


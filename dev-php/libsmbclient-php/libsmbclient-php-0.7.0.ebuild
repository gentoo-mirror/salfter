# $Id$

EAPI=5

PHP_EXT_NAME="libsmbclient"
USE_PHP="php5-6 php5-5 php5-4"

inherit php-ext-source-r2 eutils

DESCRIPTION="smbclient's extension for PHP"
HOMEPAGE="https://github.com/eduardok/libsmbclient-php"
SRC_URI="https://github.com/eduardok/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="|| ( >=net-fs/samba-4[client] <net-fs/samba-4[smbclient] )"


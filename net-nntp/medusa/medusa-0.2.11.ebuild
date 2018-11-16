# see https://github.com/pymedusa/Medusa/issues/3147 for Medusa hints

# retrieved from https://gitlab.com/salfter/portage/tree/b899ed256d8472ba9ea40e4544523c93e2998e72/net-nntp/sickrage

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

SRC_URI="https://github.com/pymedusa/Medusa/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=$WORKDIR/Medusa-${PV}

inherit eutils user python-single-r1

DESCRIPTION="Automatic Video Library Manager for TV Shows"
HOMEPAGE="https://pymedusa.com/"

LICENSE="GPL-3" # only
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPS}"
#RDEPEND	>=dev-python/beautifulsoup-4.6.3
#
RDEPEND="
	>=www-servers/tornado-5.1.1
	dev-python/six
	dev-python/profilehooks
	dev-python/contextlib2
	>=dev-python/rarfile-3.0
	>=dev-python/bencode-2.0.0
	>=dev-python/guessit-3.0.3
	>=dev-python/subliminal-2.0.5
	>=dev-python/adba-1.1.0
	>=dev-python/knowit-0.2.4
	>=dev-python/CacheControl-0.12.5
	dev-python/msgpack
	>=dev-python/imdbpie-5.6.3
	dev-python/trans
	dev-python/diskcache
	dev-python/boto_utils
	dev-python/cfscrape
	dev-python/feedparser
	>=dev-python/requests-oauthlib-1.0.0
	dev-python/twitter
	dev-python/PyGithub
	>=dev-python/validators-0.12.2
	>=dev-python/jsonrpclib-pelix-0.3.2
	>=dev-python/dirtyjson-1.0.7
	>=dev-python/mako-1.0.7
	>=dev-python/tornroutes-0.5.1
	>=dev-python/markdown2-2.3.6
"

pkg_setup() {
	python-single-r1_pkg_setup

	# Create medusa group
	enewgroup ${PN}
	# Create medusa user, put in medusa group
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_install() {
	dodoc readme.md

	newconfd "${FILESDIR}/${PN}.conf" ${PN}
	newinitd "${FILESDIR}/${PN}.init" ${PN}

	# Location of log and data files
	keepdir /var/${PN}
	fowners -R ${PN}:${PN} /var/${PN}

	keepdir /var/{${PN}/{cache,download},log/${PN}}
	fowners -R ${PN}:${PN} /var/{${PN}/{cache,download},log/${PN}}

	insinto /etc/${PN}
	insopts -m0660 -o ${PN} -g ${PN}
	doins "${FILESDIR}/${PN}.ini"

	# Rotation of log files
	insinto /etc/logrotate.d
	insopts -m0644 -o root -g root
	newins "${FILESDIR}/${PN}.logrotate" ${PN}

#	# weird stuff ;-)
#	last_commit=$(git rev-parse HEAD)
#	echo ${last_commit} > version.txt

	insinto /usr/share/${PN}
	doins -r themes lib runscripts medusa tests SickBeard.py ${FILESDIR}/autoProcessTV

	fowners -R ${PN}:${PN} /usr/share/${PN}
}

pkg_postinst() {

	# we need to remove .git which old ebuild installed
	if [[ -d "/usr/share/${PN}/.git" ]] ; then
	   ewarn "stale files from previous ebuild detected"
	   ewarn "/usr/share/${PN}/.git removed."
	   ewarn "To ensure proper operation, you should unmerge package and remove directory /usr/share/${PN} and then emerge package again"
	   ewarn "Sorry for the inconvenience"
	   rm -Rf "/usr/share/${PN}/.git"
	fi

	elog "Medusa has been installed with data directories in /var/${PN}"
	elog
	elog "New user/group ${PN}/${PN} has been created"
	elog
	elog "Config file is located in /etc/${PN}/${PN}.ini"
	elog
	elog "Please configure /etc/conf.d/${PN} before starting as daemon!"
	elog
	elog "Start with ${ROOT}etc/init.d/${PN} start"
	elog "Visit http://<host ip>:8081 to configure Medusa"
	elog "Default web username/password : medusa/secret"
	elog
}

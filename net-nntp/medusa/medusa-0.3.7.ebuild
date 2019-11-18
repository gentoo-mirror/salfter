# see https://github.com/pymedusa/Medusa/issues/3147 for Medusa hints

# retrieved from https://gitlab.com/salfter/portage/tree/b899ed256d8472ba9ea40e4544523c93e2998e72/net-nntp/sickrage

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )

SRC_URI="https://github.com/pymedusa/Medusa/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=$WORKDIR/Medusa-${PV}
# update GIT_COMMIT on version bump
GIT_COMMIT=baad1e5af59d7f29606c1fed1c110af1424bb117

inherit eutils user python-single-r1

DESCRIPTION="Automatic Video Library Manager for TV Shows"
HOMEPAGE="https://pymedusa.com/"

LICENSE="GPL-3" # only
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPS}"
# check requirements.txt for dependency changes
RDEPEND="
	>=dev-python/adba-1.1.1_alpha20191013
	>=dev-python/babelfish-0.5.6_alpha20160411
	>=dev-python/beautifulsoup-4.8.1
	>=dev-python/bencode-2.1.0
	>=dev-python/CacheControl-0.12.5
	>=dev-python/certifi-2019.6.16
	>=dev-python/cloudflare-scrape-2.0.8
	>=dev-python/chardet-3.0.4
	>=dev-python/configobj-5.0.6
	>=dev-python/contextlib2-0.5.5
	>=dev-python/deluge-client-1.7.1
	>=dev-python/dirtyjson-1.0.7
	>=dev-python/dogpile-cache-0.7.1
	>=dev-python/enum34-1.1.6
	>=dev-python/enzyme-0.4.2_alpha20180603
	>=dev-python/feedparser-5.2.2_alpha20180811
	>=dev-python/gntp-1.0.3
	>=dev-python/guessit-3.1.0
	>=dev-python/html5lib-1.0.1
	>=dev-python/imdbpie-5.6.4
	>=dev-python/Js2Py-0.66
	>=dev-python/jsonrpclib-pelix-0.4.0
	>=dev-python/knowit-0.2.5_alpha20190305
	>=dev-python/mako-1.1.0
	>=dev-python/markdown2-2.3.8
	>=dev-python/profilehooks-1.11.0
	>=dev-python/PyGithub-1.43.7
	>=dev-python/pyjwt-1.7.1
	>=dev-python/python-dateutil-2.8.0
	>=dev-python/python-twitter-3.5
	>=dev-python/rarfile-3.0
	>=dev-python/rebulk-2.0.0
	>=dev-python/requests-2.22.0
	>=dev-python/requests-oauthlib-1.2.0
	>=dev-python/six-1.12.0
	>=dev-python/subliminal-2.0.6_alpha20181128
	>=www-servers/tornado-5.1.1
	>=dev-python/tornroutes-0.5.1
	>=dev-python/tvdbv2-1.0.1_alpha20190605
	>=dev-python/validators-0.13.0
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

	insinto /usr/share/${PN}
	doins -r themes lib runscripts medusa tests SickBeard.py ${FILESDIR}/autoProcessTV

	# weird stuff for version check;-)
	#last_commit=$(git rev-parse HEAD)
	cd $S
	echo $GIT_COMMIT > version.txt
	doins $S/version.txt

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

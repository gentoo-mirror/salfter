EAPI=6

PYTHON_COMPAT=( python3_{4,5,6,7,8,9} )

SRC_URI="https://github.com/pymedusa/Medusa/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=$WORKDIR/Medusa-${PV}
# update GIT_COMMIT on version bump
GIT_COMMIT=20915b56d64dc7522e484f326d9cfe7449a73193

inherit eutils user python-single-r1

DESCRIPTION="Automatic Video Library Manager for TV Shows"
HOMEPAGE="https://pymedusa.com/"

LICENSE="GPL-3" # only
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+7za +rar unzip"

# check requirements.txt for dependency changes
DEPEND=""
RDEPEND=">=www-servers/tornado-5.1.1
	$(python_gen_cond_dep '
	>=dev-python/adba-1.1.1_alpha20191013[${PYTHON_MULTI_USEDEP}]
	>=dev-python/babelfish-0.5.6_alpha20160411[${PYTHON_MULTI_USEDEP}]
	>=dev-python/beautifulsoup-4.9.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/bencode-4.0.0[${PYTHON_MULTI_USEDEP}]
	>=dev-python/CacheControl-0.12.6[${PYTHON_MULTI_USEDEP}]
	dev-python/cachetools[${PYTHON_MULTI_USEDEP}]
	>=dev-python/certifi-2020.6.20[${PYTHON_MULTI_USEDEP}]
	>=dev-python/chardet-3.0.4[${PYTHON_MULTI_USEDEP}]
	>=dev-python/cloudscraper-1.2.40[${PYTHON_MULTI_USEDEP}]
	>=dev-python/configobj-5.0.6[${PYTHON_MULTI_USEDEP}]
	>=dev-python/contextlib2-0.6.0-r1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/deluge-client-1.9.0[${PYTHON_MULTI_USEDEP}]
	>=dev-python/dirtyjson-1.0.7[${PYTHON_MULTI_USEDEP}]
	>=dev-python/dogpile-cache-0.9.2[${PYTHON_MULTI_USEDEP}]
	>=dev-python/enzyme-0.4.2_alpha20180603[${PYTHON_MULTI_USEDEP}]
	>=dev-python/feedparser-5.2.2_alpha20180811[${PYTHON_MULTI_USEDEP}]
	>=dev-python/gntp-1.0.3[${PYTHON_MULTI_USEDEP}]
	>=dev-python/guessit-3.1.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/imdbpie-5.6.4[${PYTHON_MULTI_USEDEP}]
	>=dev-python/jsonrpclib-pelix-0.4.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/knowit-0.2.5_alpha20190305[${PYTHON_MULTI_USEDEP}]
	>=dev-python/mako-1.1.3[${PYTHON_MULTI_USEDEP}]
	>=dev-python/markdown2-2.3.9[${PYTHON_MULTI_USEDEP}]
	>=dev-python/profilehooks-1.11.2[${PYTHON_MULTI_USEDEP}]
	>=dev-python/PyGithub-1.45[${PYTHON_MULTI_USEDEP}]
	>=dev-python/pyjwt-1.7.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/python-twitter-3.5[${PYTHON_MULTI_USEDEP}]
	>=dev-python/rarfile-3.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/rebulk-2.0.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/requests-2.24.0[${PYTHON_MULTI_USEDEP}]
	>=dev-python/requests-oauthlib-1.3.0[${PYTHON_MULTI_USEDEP}]
	>=dev-python/six-1.15.0[${PYTHON_MULTI_USEDEP}]
	>=dev-python/subliminal-2.1.0[${PYTHON_MULTI_USEDEP}]
	>=dev-python/tmdbsimple-2.2.11[${PYTHON_MULTI_USEDEP}]
	>=dev-python/tornroutes-0.5.1[${PYTHON_MULTI_USEDEP}]
	>=dev-python/tvdbv2-1.0.1_alpha20190605[${PYTHON_MULTI_USEDEP}]
	>=dev-python/validators-0.15.0[${PYTHON_MULTI_USEDEP}]
	dev-python/ttl-cache[${PYTHON_MULTI_USEDEP}]
	dev-python/pytimeparse[${PYTHON_MULTI_USEDEP}]
	>=dev-python/pysrt-1.1.2[${PYTHON_MULTI_USEDEP}]
	>=dev-python/gntp-1.0.3-r1[${PYTHON_MULTI_USEDEP}]
	')"


pkg_setup() {
	#python-single-r1_pkg_setup

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

	# wipe this file to keep errors from showing on startup
	cd /usr/share/medusa/ext/ && echo -n >configparser.pth

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

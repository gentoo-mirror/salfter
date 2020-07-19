EAPI=7
PYTHON_COMPAT=(python3_{6,7,8,9})

inherit distutils-r1 user

DEPEND="
	>=dev-python/markdown-3.1[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
"
RDEPEND="
	>=dev-python/flask-0.12[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.8.1[${PYTHON_USEDEP}]
	www-servers/tornado[${PYTHON_USEDEP}]
	>=dev-python/flask-login-0.2.11[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	!=dev-python/regex-2018.11.6[${PYTHON_USEDEP}]
	>=dev-python/flask-login-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/flask-babel-0.12[${PYTHON_USEDEP}]
	>=dev-python/flask-assets-0.12[${PYTHON_USEDEP}]
	>=dev-python/blinker-1.4[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-0.16[${PYTHON_USEDEP}]
	>=dev-python/cachelib-0.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.1[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3.4[${PYTHON_USEDEP}]
	>=dev-python/netaddr-0.7.19[${PYTHON_USEDEP}]
	>=dev-python/watchdog-0.9.0[${PYTHON_USEDEP}]
	=dev-python/sarge-0.1.5[${PYTHON_USEDEP}]
	>=dev-python/netifaces-0.10.9[${PYTHON_USEDEP}]
	>=dev-python/pylru-1.2[${PYTHON_USEDEP}]
	>=dev-python/rsa-4.0[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.5.0.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22.0[${PYTHON_USEDEP}]
	>=dev-python/semantic_version-2.8[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.6.5[${PYTHON_USEDEP}]
	>=dev-python/click-7[${PYTHON_USEDEP}]
	>=dev-python/awesome-slugify-1.6.5[${PYTHON_USEDEP}]
	>=dev-python/feedparser-5.2.1[${PYTHON_USEDEP}]
	>=dev-python/future-0.18.2[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.56[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11.2[${PYTHON_USEDEP}]
	>=dev-python/emoji-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/frozendict-1.2[${PYTHON_USEDEP}]
	=dev-python/sentry-sdk-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.0.5[${PYTHON_USEDEP}]
"

MY_PN=OctoPrint
S=${WORKDIR}/${MY_PN}-${PV}

DESCRIPTION="the snappy web interface for your 3D printer"
HOMEPAGE="https://octoprint.org/"
LICENSE="AGPL-3"
SRC_URI="https://github.com/foosel/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~arm64 ~amd64"
PATCHES="$FILESDIR/$P-no-maxversions.patch"

pkg_setup()
{
	HOMEDIR=/var/lib/$PN
	enewgroup $PN
	enewuser $PN -1 -1 $HOMEDIR "$PN,uucp,video"
}

src_install()
{
	distutils-r1_src_install
	newinitd $FILESDIR/$PN.initd $PN
	newconfd $FILESDIR/$PN.confd $PN
}

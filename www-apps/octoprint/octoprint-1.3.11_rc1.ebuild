EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1 user

DEPEND=""
RDEPEND="
	>=dev-python/flask-0.10.1
	<dev-python/flask-0.11
	>=dev-python/jinja-2.8.1
	<dev-python/jinja-2.9
	>=dev-python/werkzeug-0.15.1
	<dev-python/werkzeug-0.16
	=www-servers/tornado-4.5.3
	>=dev-python/pyyaml-5.1
	<dev-python/pyyaml-6
	>=dev-python/flask-login-0.2.11
	<dev-python/flask-login-0.3
	>=dev-python/flask-principal-0.4
	<dev-python/flask-principal-0.5
	>=dev-python/flask-babel-0.12
	<dev-python/flask-babel-0.13
	>=dev-python/flask-assets-0.12
	<dev-python/flask-assets-0.13
	>=dev-python/markdown-3.0
	<dev-python/markdown-3.1
	>=dev-python/pyserial-3.4
	<dev-python/pyserial-3.5
	>=dev-python/netaddr-0.7.19
	<dev-python/netaddr-0.8
	>=dev-python/watchdog-0.9.0
	<dev-python/watchdog-0.10
	=dev-python/sarge-0.1.5
	>=dev-python/netifaces-0.10.9
	<dev-python/netifaces-0.11
	>=dev-python/pylru-1.2
	<dev-python/pylru-1.3
	>=dev-python/rsa-4.0
	<dev-python/rsa-5
	>=dev-python/pkginfo-1.5.0.1
	<dev-python/pkginfo-1.6
	>=dev-python/requests-2.21.0
	<dev-python/requests-3
	>=dev-python/semantic_version-2.6
	<dev-python/semantic_version-2.7
	>=dev-python/psutil-5.6.1
	<dev-python/psutil-5.7
	>=dev-python/click-7
	<dev-python/click-8
	>=dev-python/awesome-slugify-1.6.5
	<dev-python/awesome-slugify-1.7
	>=dev-python/feedparser-5.2.1
	<dev-python/feedparser-5.3
	>=dev-python/future-0.17.1
	<dev-python/future-0.18
	>=dev-python/scandir-1.10
	<dev-python/scandir-1.11
	>=dev-python/websocket-client-0.56
	<dev-python/websocket-client-0.57
	>=dev-python/python-dateutil-2.6.1
	<dev-python/python-dateutil-2.7
	>=dev-python/wrapt-1.11.1
	<dev-python/wrapt-1.12
	>=dev-python/futures-3.2
	<dev-python/futures-3.3
	>=dev-python/emoji-0.5.1
	<dev-python/emoji-0.6
	>=dev-python/monotonic-1.5
	<dev-python/monotonic-1.6
	>=dev-python/frozendict-1.2
	<dev-python/frozendict-1.3
	>=dev-python/chainmap-1.0.3
	<dev-python/chainmap-1.1
	dev-python/pip
	>=dev-python/typing-3.6.6
	<dev-python/typing-4
	=dev-python/sentry-sdk-0.7.7
	dev-python/regex
	!=dev-python/regex-2018.11.6
	>=dev-python/cachelib-0.1
	<dev-python/cachelib-0.2
"

MY_PN=OctoPrint
MY_PV=1.3.11rc1
S=${WORKDIR}/${MY_PN}-${MY_PV}

DESCRIPTION="the snappy web interface for your 3D printer"
HOMEPAGE="https://octoprint.org/"
LICENSE="AGPL-3"
SRC_URI="https://github.com/foosel/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~arm64 ~amd64"

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

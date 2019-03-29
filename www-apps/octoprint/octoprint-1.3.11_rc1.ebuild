EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1 user

DEPEND=""
RDEPEND="
	>=dev-python/flask-0.10.1
	<dev-python/flask-0.11
	>=dev-python/jinja-2.8.1
	<dev-python/jinja-2.9
	>=dev-python/werkzeug-0.8.3
	<dev-python/werkzeug-0.9
	=www-servers/tornado-4.5.3
	>=dev-python/sockjs-tornado-1.0.3
	<dev-python/sockjs-tornado-1.1
	>=dev-python/pyyaml-3.10
	<dev-python/pyyaml-3.11
	>=dev-python/flask-login-0.2.11
	<dev-python/flask-login-0.3
	>=dev-python/flask-principal-0.3.5
	<dev-python/flask-principal-0.4
	>=dev-python/flask-babel-0.9
	<dev-python/flask-babel-0.10
	>=dev-python/flask-assets-0.10
	<dev-python/flask-assets-0.11
	>=dev-python/markdown-2.6.9
	<dev-python/markdown-2.7
	>=dev-python/pyserial-3.4
	<dev-python/pyserial-3.5
	>=dev-python/netaddr-0.7.19
	<dev-python/netaddr-0.8
	>=dev-python/watchdog-0.8.3
	<dev-python/watchdog-0.9
	=dev-python/sarge-0.1.5
	>=dev-python/netifaces-0.10.6
	<dev-python/netifaces-0.11
	>=dev-python/pylru-1.0.9
	<dev-python/pylru-1.1
	>=dev-python/rsa-3.2.3
	<dev-python/rsa-3.3
	>=dev-python/pkginfo-1.4.2
	<dev-python/pkginfo-1.5
	>=dev-python/requests-2.18.4
	<dev-python/requests-3
	>=dev-python/semantic_version-2.4.2
	<dev-python/semantic_version-2.5
	>=dev-python/psutil-5.4.6
	<dev-python/psutil-5.5
	>=dev-python/click-6.2
	<dev-python/click-6.3
	>=dev-python/awesome-slugify-1.6.5
	<dev-python/awesome-slugify-1.7
	>=dev-python/feedparser-5.2.1
	<dev-python/feedparser-5.3
	>=dev-python/future-0.15.2
	<dev-python/future-0.16
	>=dev-python/scandir-1.3
	<dev-python/scandir-1.4
	>=dev-python/websocket-client-0.40.0
	<dev-python/websocket-client-0.41
	>=dev-python/python-dateutil-2.6.1
	<dev-python/python-dateutil-2.7
	>=dev-python/wrapt-1.10.11
	<dev-python/wrapt-1.11
	>=dev-python/futures-3.1.1
	<dev-python/futures-3.2
	>=dev-python/emoji-0.4.5
	<dev-python/emoji-0.5
	>=dev-python/monotonic-1.3
	<dev-python/monotonic-1.4
	>=dev-python/frozendict-1.2
	<dev-python/frozendict-1.3
	>=dev-python/chainmap-1.0.2
	<dev-python/chainmap-1.1
	dev-python/pip
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

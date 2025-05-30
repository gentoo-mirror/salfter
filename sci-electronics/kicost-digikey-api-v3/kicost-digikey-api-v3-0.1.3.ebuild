EAPI=8
PYTHON_COMPAT=( python3_{8..13} pypy3 ) 

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="experimental plug-in to allow KiCost to do native Digi-Key API requests"
HOMEPAGE="https://github.com/set-soft/kicost-digikey-api-v3"
SRC_URI="https://github.com/set-soft/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
DISTUTILS_USE_PEP517=setuptools

LICENSE=GPL-3
SLOT=0
KEYWORDS=amd64

RDEPEND="
	>=dev-python/inflection-0.3.1
	>=dev-python/requests-2.21
	>=dev-python/urllib3-1.24
	dev-python/six
	dev-python/certifi
	dev-python/pyopenssl
	dev-python/tldextract
	dev-python/python-dateutil
"

pkg_postinst()
{
	ewarn "Use of kicost-digikey-api-v3 requires registration with DigiKey;"
	ewarn "see https://github.com/set-soft/kicost-digikey-api-v3 for details."
}

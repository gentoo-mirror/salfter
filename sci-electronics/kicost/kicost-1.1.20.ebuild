EAPI=8
PYTHON_COMPAT=( python3_{8..13} ) 

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="generate part-cost spreadsheets for circuit boards developed with KiCad"
HOMEPAGE="https://github.com/hildogjr/KiCost"
SRC_URI="https://github.com/hildogjr/KiCost/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/KiCost-$PV
DISTUTILS_USE_PEP517=setuptools

LICENSE=MIT
SLOT=0
KEYWORDS=amd64

RDEPEND="
	>=dev-python/beautifulsoup4-4.3.2
	>=dev-python/lxml-3.7.2
	>=dev-python/xlsxwriter-0.7.3
	>=dev-python/tqdm-4.30.0
	>=dev-python/requests-2.18.4
	>=dev-python/validators-0.14.2
	>=dev-python/wxpython-3.0.2
	dev-python/colorama
	dev-python/pyyaml
	>=sci-electronics/kicost-digikey-api-v3-0.1.1
	"

src_prepare()
{
	default_src_prepare
	rm -r $S/tests
}

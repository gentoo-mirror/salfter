EAPI=7
PYTHON_COMPAT=(python3_{6,7,8})

inherit distutils-r1

DESCRIPTION="Python library for Solo U2F keys"
HOMEPAGE="https://github.com/solokeys/solo-python"
SRC_URI="https://github.com/solokeys/$PN/archive/$PV.tar.gz -> $P.tar.gz"
LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
DISTUTILS_USE_SETUPTOOLS=pyproject.toml

DEPEND=">=dev-python/pyproject2setuppy-7
	>=dev-python/fido2-0.8.1
	dev-python/flit"
RDEPEND="dev-python/click"

python_install()
{
	distutils-r1_python_install

	cd $WORKDIR/$P/solo || die
	python_moduleinto ./solo/
	python_domodule VERSION 
}

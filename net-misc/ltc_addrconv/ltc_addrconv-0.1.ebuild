EAPI=6
PYTHON_COMPAT=( python2_7 pypy )
DESCRIPTION="Litecoin 3/M-address converter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RDEPEND="dev-python/pybitcoin"

src_unpack()
{
  mkdir -p "${WORKDIR}/${P}"
}

src_install()
{
  dobin "${FILESDIR}/ltc_addrconv"
}

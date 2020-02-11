EAPI="5"

inherit git-r3 eutils 

DESCRIPTION="altcoin mining profitability switcher"
HOMEPAGE="https://gitlab.com/salfter/MinerSwitcher"

EGIT_REPO_URI="https://gitlab.com/salfter/MinerSwitcher.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/ProfitLib
		 dev-python/pycgminer
		 dev-python/python-pushover
		 dev-python/python-nmap
		 dev-python/tabulate"
		 
src_install()
{
  mv MinerSwitcher.py MinerSwitcher
  mv SwitchCoin.py SwitchCoin
  dobin MinerSwitcher
  dobin SwitchCoin
  dodoc *_example.json
  dodoc README.md
}

pkg_postinst()
{
  elog "To use, copy the config files from /usr/share/doc/${P}"
  elog "to an empty directory, edit as appropriate, and run MinerSwitcher"
  elog "from within that directory."
}

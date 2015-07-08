EAPI="5"

inherit git-2 eutils 

DESCRIPTION="altcoin mining profitability switcher"
HOMEPAGE="https://github.com/salfter/MinerSwitcher"
EGIT_PROJECT="MinerSwitcher"
EGIT_REPO_URI="https://github.com/salfter/MinerSwitcher"

LICENSE="MIT"
SLOT="0"
KEYWORDS="**"

RDEPEND="dev-python/ProfitLib
		 dev-python/pycgminer
		 dev-python/python-pushover
		 dev-python/python-nmap"
		 
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

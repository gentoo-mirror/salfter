EAPI=5
inherit eutils git-2
DESCRIPTION="Raspberry Pi config tool"
HOMEPAGE="https://github.com/asb/raspi-config"
SRC_URI=""
EGIT_PROJECT="raspi-config"
EGIT_REPO_URI="git://github.com/asb/raspi-config https://github.com/asb/raspi-config"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND="dev-libs/newt
		 sys-block/parted
		 >=dev-lang/lua-5.1
		 app-misc/triggerhappy"

src_install()
{
  cd ${S}
  dosbin raspi-config
}

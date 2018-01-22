EAPI="5"

inherit autotools flag-o-matic versionator git-2

DESCRIPTION="m7m CPU miner"
HOMEPAGE="https://github.com/magi-project/wolf-m7m-cpuminer-V2"
EGIT_PROJECT="wolf-m7m-cpuminer"
EGIT_REPO_URI="https://github.com/magi-project/wolf-m7m-cpuminer-V2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_prepare() {
	# https://bitcointalk.org/index.php?topic=735170.msg10367722#msg10367722
	cd ${S}
	for i in Makefile.am m7/Makefile.am m7/Makefile.in
	do 
		sed -i "s/-flto//g" $i
	done	

	eautoreconf
}

src_install() {
	newbin minerd m7m-minerd
}

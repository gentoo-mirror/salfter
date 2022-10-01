EAPI=8

DESCRIPTION="Make tarballs of given git repository, including its submodules"
HOMEPAGE="https://github.com/devsisters/tarballize"
GIT_COMMIT=8846151151985ad5904fac5df8689390d00080f4
SRC_URI="https://github.com/devsisters/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"
S=$WORKDIR/$PN-$GIT_COMMIT
DEPEND="dev-vcs/git"
LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

src_install()
{
  dobin $S/tarballize
  dodoc $S/README.md
}

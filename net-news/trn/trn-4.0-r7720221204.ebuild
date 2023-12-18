EAPI="8"

DESCRIPTION="threaded news reader"
HOMEPAGE="https://github.com/arnoldrobbins/trn/"
GIT_COMMIT=a7853e2a71996c93db86a14b41f086778449064e
S=$WORKDIR/$PN-$GIT_COMMIT
SRC_URI="https://github.com/arnoldrobbins/$PN/archive/$GIT_COMMIT.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

src_prepare() {
  cd $S 
  cp ${FILESDIR}/config.sh . 
  yes | ./Configure -dse 
  default
}

src_install() {
  for i in Rnmail Pnews trn strn
  do
    doman ${S}/$i.1
  done

  for i in Rnmail Pnews trn trn-artchk nntplist inews
  do
    dobin ${S}/$i
  done
  
  dosym /usr/bin/trn /usr/bin/strn

  dodir /usr/lib/${PN}
  insinto /usr/lib/${PN}
  for i in norm.saver newsnews access.def makedir Speller INIT filexp mbox.saver Pnews.header
  do
    newins ${S}/$i $i
  done

  dodir /usr/lib/${PN}/HelpFiles
  insinto /usr/lib/${PN}/HelpFiles
  for i in changelog hints quickstart top
  do
    newins ${S}/HelpFiles/$i $i
  done

  dodir /usr/lib/${PN}/HelpFiles/config
  insinto /usr/lib/${PN}/HelpFiles/config
  for i in environment index macros options
  do
    newins ${S}/HelpFiles/config/$i $i
  done

  dodir /usr/lib/${PN}/HelpFiles/samples
  insinto /usr/lib/${PN}/HelpFiles/samples
  for i in access index trnrc
  do
    newins ${S}/HelpFiles/samples/$i $i
  done
}

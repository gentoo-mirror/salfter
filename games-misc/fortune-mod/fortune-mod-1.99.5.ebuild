# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/fortune-mod/fortune-mod-1.99.1-r2.ebuild,v 1.8 2010/01/25 22:52:18 mr_bones_ Exp $

EAPI=5
inherit eutils toolchain-funcs

DESCRIPTION="The notorious fortune program"
HOMEPAGE="http://www.shlomifish.org/open-source/projects/fortune-mod/"
SRC_URI="http://www.shlomifish.org/open-source/projects/fortune-mod/arcs/${P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="offensive elibc_glibc"

DEPEND="app-text/recode"

src_prepare() {
	for i in $FORTUNE_DELETE
	do
		find $S -type f -name $i -exec rm \{} \;
		for j in $S/datfiles/Makefile $S/datfiles/off/Makefile
		do
			sed "s/$i//" $j >$j.tmp && mv $j.tmp $j || die "delete failed"
		done
	done

	sed -i \
		-e 's:/games::' \
		-e 's:/fortunes:/fortune:' \
		-e '/^FORTDIR=/s:=.*:=$(prefix)/usr/bin:' \
		-e '/^all:/s:$: fortune/fortune.man:' \
		-e "/^OFFENSIVE=/s:=.*:=`use offensive && echo 1 || echo 0`:" \
		Makefile || die "sed Makefile failed"

	if ! use elibc_glibc ; then
		local reglibs="-lcompat"
		has_version "app-text/recode[nls]" && reglibs="${reglibs} -lintl"
		sed -i \
			-e "/^REGEXLIBS=/s:=.*:= ${reglibs}:" \
			Makefile \
			|| die "sed REGEXLIBS failed"
	fi
}

src_compile() {
	emake CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	emake prefix="${D}" install || die "emake install failed"
	dodoc ChangeLog INDEX Notes Offensive README TODO cookie-files
}

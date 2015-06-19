# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit mono subversion

DESCRIPTION="a C# port of the Java port of GNU getopt"
HOMEPAGE="http://getopt.codeplex.com/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/mono"
DEPEND="${RDEPEND}"

ESVN_REPO_URI="https://getopt.svn.codeplex.com/svn/Gnu.Getopt"
ESVN_PROJECT="gnu-getopt-net"

src_compile() {
	cd ${S}/Gnu.Getopt
	dmcs -out:Gnu.Getopt.dll -target:library *.cs Properties/*.cs -keyfile:Gnu.Getopt.snk
}

src_install() {
	cd ${S}/Gnu.Getopt
	gacutil -i Gnu.Getopt.dll
}

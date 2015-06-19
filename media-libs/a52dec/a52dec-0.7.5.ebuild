# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools eutils flag-o-matic

DESCRIPTION="library for decoding ATSC A/52 streams used in DVD"
HOMEPAGE="http://liba52.sourceforge.net/"
SRC_URI="http://liba52.sourceforge.net/files/a52dec-snapshot.tar.gz"
S="${WORKDIR}/a52dec-0.7.5-cvs"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="djbfft oss static-libs"

RDEPEND="djbfft? ( sci-libs/djbfft )"
DEPEND="${RDEPEND}"

src_configure() {
	filter-flags -fprefetch-loop-arrays

	local myconf
	use oss || myconf="${myconf} --disable-oss"

	cd ${S}
	econf \
		--enable-shared \
		$(use_enable static-libs static) \
		$(use_enable djbfft) \
		${myconf}
}

src_compile() {
	emake CFLAGS="${CFLAGS}" || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	insinto /usr/include/a52dec
	doins liba52/a52_internal.h || die

	dodoc AUTHORS ChangeLog HISTORY NEWS README TODO doc/liba52.txt

	find "${ED}" -name '*.la' -exec rm -f {} +
}

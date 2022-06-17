# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 cmake-utils

DESCRIPTION="MJPG-streamer takes JPGs from Linux-UVC compatible webcams"
HOMEPAGE="https://sourceforge.net/projects/mjpg-streamer"
#SRC_URI="https://dev.gentoo.org/~aidecoe/distfiles/${CATEGORY}/${PN}/${P}.tar.bz2"
EGIT_REPO_URI=https://github.com/jacksonliam/$PN

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm64"

S=$WORKDIR/$P/$PN-experimental

INPUT_PLUGINS="input_testpicture input_control input_file input_uvc input_raspicam"
OUTPUT_PLUGINS="output_file output_udp output_http output_autofocus output_rtsp"
IUSE_PLUGINS="${INPUT_PLUGINS} ${OUTPUT_PLUGINS}"
IUSE="input_testpicture input_control input_file +input_uvc input_raspicam output_file
	output_udp +output_http output_autofocus output_rtsp
	www v4l"
REQUIRED_USE="|| ( ${INPUT_PLUGINS} )
	|| ( ${OUTPUT_PLUGINS} )
	v4l? ( input_uvc )"

RDEPEND="virtual/jpeg
	v4l? ( input_uvc? ( media-libs/libv4l ) )"
DEPEND="${RDEPEND}
	input_testpicture? ( media-gfx/imagemagick )
	virtual/jpeg
	dev-libs/protobuf-c
	media-libs/libgphoto2
	media-libs/libsdl
	input_raspicam? ( >=media-libs/raspberrypi-userland-1.20190114 )"

src_compile() {
	local v4l=$(use v4l && use input_uvc && echo 'USE_LIBV4L2=true')
	emake ${v4l}
}

src_install() {
	into /usr
	dobin ${PN//-/_}
	dolib.so *.so

	if use www ; then
		insinto /usr/share/${PN}
		doins -r www
	fi

	dodoc README.md

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}

pkg_postinst() {
	elog "Remember to set an input and output plugin for mjpg-streamer."

	if use www ; then
		echo
		elog "An example webinterface has been installed into"
		elog "/usr/share/mjpg-streamer/www for your usage."
	fi
}

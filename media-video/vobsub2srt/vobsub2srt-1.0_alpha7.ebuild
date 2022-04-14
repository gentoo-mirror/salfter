# -*- mode:sh; -*-

# See https://github.com/ruediger/VobSub2SRT/issues/13

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SRC_URI="https://github.com/ruediger/VobSub2SRT/archive/v1.0pre7.tar.gz -> $P.tar.gz"
S=$WORKDIR/VobSub2SRT-1.0pre7

inherit cmake

IUSE=""

DESCRIPTION="Converts image subtitles created by VobSub (.sub/.idx) to .srt textual subtitles using tesseract OCR engine"
HOMEPAGE="https://github.com/ruediger/VobSub2SRT"

PATCHES=$FILESDIR/cppflags.patch

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND=">=app-text/tesseract-2.04-r1
    >=virtual/ffmpeg-0.6.90"
DEPEND="${RDEPEND}"

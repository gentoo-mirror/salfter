EAPI=8

inherit cmake

DESCRIPTION="converts analog broadcast radio to audio streams"
HOMEPAGE=https://github.com/charlie-foxtrot/RTLSDR-Airband
SRC_URI="https://github.com/charlie-foxtrot/RTLSDR-Airband/archive/refs/tags/v${PV}.tar.gz -> $P.tar.gz"
LICENSE=GPL-3
SLOT=0
KEYWORDS=amd64
S=$WORKDIR/RTLSDR-Airband-${PV}

IUSE="pulseaudio nfm rtlsdr soapysdr" # mirisdr

RDEPEND="dev-libs/libconfig[cxx]
	 media-libs/libshout
	 media-sound/lame
	 sci-libs/fftw
	 pulseaudio? ( media-sound/pulseaudio )
	 rtlsdr? ( net-wireless/rtl-sdr )
	 soapysdr? ( net-wireless/soapysdr )"

PATCHES="$FILESDIR/$P-libshout-2.4.6.patch"

src_configure(){
	local mycmakeargs=(
		-DNFM=$(usex nfm ON OFF)
		-DWITH_PULSEAUDIO=$(usex pulseaudio ON OFF)
		-DWITH_RTLSDR=$(usex rtlsdr ON OFF)
		-DWITH_SOAPYSDR=$(usex soapysdr ON OFF)
	)
	cmake_src_configure
}

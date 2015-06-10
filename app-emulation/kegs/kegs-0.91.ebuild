EAPI="5"

inherit eutils

DESCRIPTION="Apple IIGS emulator"
HOMEPAGE="http://kegs.sourceforge.net"
SRC_URI="ftp://ftp.apple.asimov.net/pub/apple_II/emulators/kegs/Kegs%20v0.91%20%28with%20system%206%20and%20free%20games%29.zip -> ${P}.zip"
DEPEND="x11-libs/libXext"
LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"

src_unpack() {
  mkdir ${S}
  cd ${S}
  unpack ${A}
  unpack ./ROMS/rom1.zip
  mv APPLE2GS.ROM rom1.rom
  unpack ./ROMS/rom3.zip
  mv APPLE2GS.ROM2 rom3.rom
  unpack ./ROMS/System\ 6.0.1.zip
  mv System\ 6\ and\ Free\ Games.hdv boot.hdv
}

src_prepare() {
  epatch ${FILESDIR}/${P}-vars.patch
  epatch ${FILESDIR}/${P}-config.patch  
}

src_compile() {
  cd ${S}/src
  emake
}

src_install() {
  dobin ${S}/xkegs
  
  dodoc ${S}/README.kegs.txt
  
  dodir /usr/share/kegs
  insinto /usr/share/kegs
  newins ${S}/rom1.rom rom1.rom
  newins ${S}/rom3.rom rom3.rom
  newins ${S}/boot.hdv boot.hdv
  newins ${S}/config.kegs config.kegs

  newicon ${FILESDIR}/apple_logo.png ${PN}.png

  newmenu ${FILESDIR}/${PN}.desktop ${PN}.desktop
}

pkg_postinst() {
  ewarn "KEGS only supports OSS for sound output.  If you're using ALSA,"
  ewarn "load the snd_pcm_oss module.  (See /etc/conf.d/modules.)"
  elog ""
  elog "To use, copy boot.hdv and config.kegs from /usr/share/kegs to your"
  elog "home directory.  boot.hdv contains System 6.0.1 and some games."
  elog "By default, ROM 3 firmware is loaded.  ROM 01 is also available."
  elog "When KEGS is running, press F4 to enter the settings menu."
}

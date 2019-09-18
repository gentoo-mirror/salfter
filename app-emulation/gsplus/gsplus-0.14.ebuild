EAPI="5"

inherit eutils

DESCRIPTION="Apple IIGS emulator, based on KEGS"
HOMEPAGE="https://apple2.gs/plus/"
SRC_URI="https://github.com/digarok/gsplus/archive/v${PV}.tar.gz -> ${P}.tar.gz
         ftp://ftp.apple.asimov.net/pub/apple_II/emulators/kegs/Kegs%20v0.91%20%28with%20system%206%20and%20free%20games%29.zip -> kegs-0.91.zip"
DEPEND="net-libs/libpcap
	media-libs/libsdl2
	media-libs/sdl2-image
	media-libs/freetype"
LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"

src_unpack() {
  mkdir ${WORKDIR}
  unpack ${P}.tar.gz
  unpack kegs-0.91.zip
  cd ROMS
  unpack ./rom1.zip
  mv APPLE2GS.ROM rom1.rom
  unpack ./rom3.zip
  mv APPLE2GS.ROM2 rom3.rom
  unpack ./System\ 6.0.1.zip
  mv System\ 6\ and\ Free\ Games.hdv boot.po
  cd ..
}

src_prepare() {
  cd ${S}/src
  ln -s vars_x86linux_sdl2 vars
}

src_compile() {
  cd ${S}/src
  emake
}

src_install() {
  dobin ${S}/gsplus

  dodir /usr/share/gsplus
  insinto /usr/share/gsplus
  newins ${WORKDIR}/ROMS/rom1.rom rom1.rom
  newins ${WORKDIR}/ROMS/rom3.rom rom3.rom
  newins ${WORKDIR}/ROMS/boot.po boot.po
  doins ${S}/src/config.txt 

  newicon ${FILESDIR}/apple_logo.png ${PN}.png

  newmenu ${FILESDIR}/${PN}.desktop ${PN}.desktop
}

pkg_postinst() {
  elog ""
  elog "To use, copy config.txt from /usr/share/gsplus to ~/.config.gsp"
  elog "and copy boot.po from /usr/share/gsplus to a convenient location."
  elog "boot.po contains System 6.0.1 and some games."
  elog ""
  elog "ROM 01 and ROM 3 firmware are both available in /usr/share/gsplus."
  elog "When GSplus is running, press F4 to enter the settings menu to"
  elog "select which ROM to use."
}

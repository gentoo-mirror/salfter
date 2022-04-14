EAPI=8

inherit desktop

DESCRIPTION="Apple IIGS emulator, based on KEGS"
HOMEPAGE="https://apple2.gs/plus/"
SRC_URI="https://github.com/digarok/gsplus/archive/v${PV}.tar.gz -> ${P}.tar.gz
         ftp://ftp.apple.asimov.net/pub/apple_II/emulators/rom_images/iigs_rom01.zip
         ftp://ftp.apple.asimov.net/pub/apple_II/emulators/rom_images/iigs_rom03.zip
         ftp://ftp.apple.asimov.net/pub/apple_II/images/gs/os/gsos/Apple_IIGS_System_6.0.4/Live.Install.po -> boot.po"
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
  mkdir ROMS
  cd ROMS
  unpack iigs_rom01.zip
  mv APPLE2GS.ROM rom1.rom
  unpack iigs_rom03.zip
  mv APPLE2GS.ROM2 rom3.rom
}

src_prepare() {
  default
  cd ${S}/src
  ln -s vars_x86linux_sdl2 vars
}

src_compile() {
  cd ${S}/src
  emake
}

src_install() {
  dobin ${S}/gsplus

  dodoc ${S}/doc/gsplusmanual.pdf

  dodir /usr/share/gsplus
  insinto /usr/share/gsplus
  newins ${WORKDIR}/ROMS/rom1.rom rom1.rom
  newins ${WORKDIR}/ROMS/rom3.rom rom3.rom
  newins ${DISTDIR}/boot.po boot.po
  doins ${S}/src/config.txt 

  newicon ${FILESDIR}/apple_logo.png ${PN}.png

  newmenu ${FILESDIR}/${PN}.desktop ${PN}.desktop
}

pkg_postinst() {
  setcap cap_net_raw,cap_net_admin=eip ${EPREFIX}/usr/bin/gsplus
  elog ""
  elog "To use, copy config.txt from /usr/share/gsplus to ~/.config.gsp"
  elog "and copy boot.po from /usr/share/gsplus to a convenient location."
  elog "boot.po contains System 6.0.4."
  elog ""
  elog "ROM 01 and ROM 3 firmware are both available in /usr/share/gsplus."
  elog "When GSplus is running, press F4 to enter the settings menu to"
  elog "select which ROM to use."
}

EAPI=8

inherit desktop git-r3

DESCRIPTION="Apple IIGS emulator, based on KEGS"
HOMEPAGE="http://gsport.sourceforge.net"
EGIT_REPO_URI="https://github.com/david-schmidt/gsport"
SRC_URI="ftp://ftp.apple.asimov.net/pub/apple_II/emulators/kegs/Kegs%20v0.91%20%28with%20system%206%20and%20free%20games%29.zip -> kegs-0.91.zip"
DEPEND="x11-libs/libXext
        sdl? ( media-libs/libsdl media-libs/freetype )"
LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE="sdl"

src_unpack() {
  git-r3_fetch
  git-r3_checkout
  mkdir kegs-0.91
  cd kegs-0.91
  unpack kegs-0.91.zip
  unpack ./ROMS/rom1.zip
  mv APPLE2GS.ROM ../${P}/rom1.rom
  unpack ./ROMS/rom3.zip
  mv APPLE2GS.ROM2 ../${P}/rom3.rom
  unpack ./ROMS/System\ 6.0.1.zip
  mv System\ 6\ and\ Free\ Games.hdv ../${P}/boot.po
  cd ..
  rm -r kegs-0.91
}

src_prepare() {
  eapply_user

  cd ${S}
  
  if use sdl; then
    cp src/vars_x86linux_sdl src/vars
    eapply ${FILESDIR}/${P}-vars-sdl.patch
  else
    cp src/vars_x86linux src/vars
    eapply ${FILESDIR}/${P}-vars.patch
  fi

  tr -d "\r" <config.template >config.template~ && mv config.template~ config.template
  eapply ${FILESDIR}/${PN}-config.patch
  eapply ${FILESDIR}/${PN}-path.patch
}

src_compile() {
  cd ${S}/src
  emake
}

src_install() {
  dobin ${S}/gsportx
  
  for i in printer operating index history ethernet developing
  do
    newdoc ${S}/doc/web/src/site/apt/${i}.apt ${i}.txt
  done
  
  dodir /usr/share/gsport
  insinto /usr/share/gsport
  newins ${S}/rom1.rom rom1.rom
  newins ${S}/rom3.rom rom3.rom
  newins ${S}/boot.po boot.po
  newins ${S}/config.template config.txt

  newicon ${FILESDIR}/apple_logo.png ${PN}.png

  newmenu ${FILESDIR}/${PN}.desktop ${PN}.desktop
}

pkg_postinst() {
  ewarn "GSport only supports OSS for sound output.  If you're using ALSA,"
  ewarn "load the snd_pcm_oss module.  (See /etc/conf.d/modules.)"
  elog ""
  elog "To use, copy boot.po and config.txt from /usr/share/gsport to"
  elog "~/.GSport.  boot.po contains System 6.0.1 and some games."
  elog "By default, ROM 3 firmware is loaded.  ROM 01 is also available."
  elog "When GSport is running, press F4 to enter the settings menu."
}

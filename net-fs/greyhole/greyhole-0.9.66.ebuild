# $Header: $

EAPI="4"

inherit eutils versionator

DESCRIPTION="redundant storage pooling using Samba"
HOMEPAGE="https://www.greyhole.net/"
SRC_URI="https://github.com/gboudreau/Greyhole/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="logrotate cron"

DEPEND="app-portage/gentoolkit"
RDEPEND=">=net-fs/samba-3.4
         <net-fs/samba-4.5
         >=dev-lang/php-5.0[mysql,pdo,intl,cli]"

get_samba_ver()
{
  samba_ver=$(best_version net-fs/samba | sed "s/net-fs\/samba-//") 
  samba_majver=$(get_version_component_range 1-2 $samba_ver)
  echo "samba_ver="$samba_ver
  echo "samba_majver="$samba_majver
}

src_prepare()
{
  eval $(get_samba_ver)

  tar xf ${PORTDIR}/distfiles/samba-${samba_ver}.tar.* || die "Samba ${samba_ver} tarball missing from ${PORTDIR}/distfiles"
  case $samba_majver in
  3.[4-6])
    ;;
  4.[0-4])
    ;;
  *)
    die "${P} doesn't support samba-$samba_majver"
    ;;
  esac    
  cd docs || die
  gunzip greyhole.1.gz
  gunzip greyhole.conf.5.gz
  gunzip greyhole-dfree.1.gz
}

src_configure()
{
  eval $(get_samba_ver)

  case $samba_majver in
  3.[4-6])
    cd samba-${samba_ver}/source3 || die
    cp ../../samba-module/vfs_greyhole-samba-${samba_majver}.c modules/vfs_greyhole.c || die
    econf || die
    patch -p1 <../../samba-module/Makefile-samba-${samba_majver}.patch || die
    ;;
  4.[0-4])
    cd samba-${samba_ver} || die
    cp ../samba-module/vfs_greyhole-samba-${samba_majver}.c source3/modules/vfs_greyhole.c || die
    patch -p1 <../samba-module/wscript-samba-${samba_majver}.patch || die
    econf --enable-fhs --with-modulesdir=/usr/$(get_libdir)/samba || die    
    ;;
  esac
}

src_compile()
{
  eval $(get_samba_ver)

  case $samba_majver in
  3.[4-6])
    cd ${WORKDIR}/${P}/samba-*/source3 || die
    emake modules || die
  ;;
  4.[0-4])
    cd ${WORKDIR}/${P}/samba-${samba_ver} || die
    emake || die
    ;;
  esac
}

src_install()
{
  eval $(get_samba_ver)

  dodir /var/spool/greyhole || die
  fperms 777 /var/spool/greyhole
  dodir /usr/share/greyhole || die
  
  newinitd "${FILESDIR}/greyhole.initd" ${PN}
  
  dobin ${PN}
  dobin ${PN}-dfree

  insinto /usr/share/greyhole
  insopts -m755
  newins greyhole-dfree.php greyhole-dfree.php
 
  insinto /etc
  insopts -m644
  newins greyhole.example.conf ${PN}.conf.example 
  
  doman docs/*
  dodoc INSTALL
  dodoc UPGRADING
  dodoc USAGE
  dodoc CHANGES

  case $samba_majver in
  3.[4-6])
    cd ${WORKDIR}/${P}/samba-*/source3 || die

    dodir /usr/$(get_libdir)/greyhole
    insinto /usr/$(get_libdir)/greyhole
    insopts -m755
    newins bin/greyhole.so greyhole-samba`echo $samba_majver | tr -d "."`.so
    insopts -m644
    dosym /usr/$(get_libdir)/greyhole/greyhole-samba`echo $samba_majver | tr -d "."`.so /usr/$(get_libdir)/greyhole/greyhole.so
    dosym /usr/$(get_libdir)/greyhole/greyhole-samba`echo $samba_majver | tr -d "."`.so /usr/$(get_libdir)/samba/vfs/greyhole.so
    ;;
  4.[0-4])
    cd ${WORKDIR}/${P}/samba-${samba_ver} || die
    
    dodir /usr/$(get_libdir)/greyhole
    insinto /usr/$(get_libdir)/greyhole
    insopts -m755
    newins bin/default/source3/modules/libvfs_module_greyhole.so greyhole-samba`echo $samba_majver | tr -d "."`.so
    insopts -m644
    dosym /usr/$(get_libdir)/greyhole/greyhole-samba`echo $samba_majver | tr -d "."`.so /usr/$(get_libdir)/greyhole/greyhole.so
    dosym /usr/$(get_libdir)/greyhole/greyhole-samba`echo $samba_majver | tr -d "."`.so /usr/$(get_libdir)/samba/vfs/greyhole.so
    ;;
  esac

  cd ${WORKDIR}/${P}

  if use logrotate; then
    insinto /etc/logrotate.d
    newins logrotate.greyhole ${PN}
  fi

  if use cron; then
    insinto /etc/cron.d
    newins greyhole.cron.d ${PN}
    insinto /etc/cron.daily
    newins greyhole.cron.daily ${PN}
    insinto /etc/cron.weekly
    newins greyhole.cron.weekly ${PN}
  fi
}

pkg_postinst()
{
  elog "You will need to set up /etc/greyhole.conf before use; refer to the"
  elog "provided example.  You also need to set up your Samba shares to use"
  elog "Greyhole and create a landing zone for your files; refer to the"
  elog "Greyhole documentation for details."
  elog ""
  elog "/etc/init.d/greyhole needs to be added to the default runlevel."
}

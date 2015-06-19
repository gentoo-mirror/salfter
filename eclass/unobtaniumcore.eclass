# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#
# @ECLASS: unobtaniumcore.eclass
# @MAINTAINER:
# Luke Dashjr <luke_gentoo_unobtanium@dashjr.org>
# @BLURB: common code for Unobtanium Core ebuilds
# @DESCRIPTION:
# This eclass is used in Unobtanium Core ebuilds (unobtanium-qt, unobtaniumd,
# libunobtaniumconsensus) to provide a single common place for the common ebuild
# stuff.
#
# The eclass provides all common dependencies as well as common use flags.

has "${EAPI:-0}" 5 || die "EAPI=${EAPI} not supported"

if [[ ! ${_UNOBTANIUMCORE_ECLASS} ]]; then

in_bcc_iuse() {
	local liuse=( ${UNOBTANIUMCORE_IUSE} )
	has "${1}" "${liuse[@]#[+-]}"
}

in_bcc_policy() {
	local liuse=( ${UNOBTANIUMCORE_POLICY_PATCHES} )
	has "${1}" "${liuse[@]#[+-]}"
}
in_bcc_policy cpfpd
in_bcc_policy spamfilter

DB_VER="4.8"
inherit autotools db-use eutils

if [ -z "$UNOBTANIUMCORE_COMMITHASH" ]; then
	inherit git-2
fi

fi

EXPORT_FUNCTIONS src_prepare src_test src_install

if in_bcc_iuse ljr || in_bcc_iuse 1stclassmsg || in_bcc_iuse zeromq || [ -n "$UNOBTANIUMCORE_POLICY_PATCHES" ]; then
	EXPORT_FUNCTIONS pkg_pretend
fi

if [[ ! ${_UNOBTANIUMCORE_ECLASS} ]]; then

# @ECLASS-VARIABLE: UNOBTANIUMCORE_COMMITHASH
# @DESCRIPTION:
# Set this variable before the inherit line, to the upstream commit hash.

# @ECLASS-VARIABLE: UNOBTANIUMCORE_IUSE
# @DESCRIPTION:
# Set this variable before the inherit line, to the USE flags supported.

# @ECLASS-VARIABLE: UNOBTANIUMCORE_LJR_DATE
# @DESCRIPTION:
# Set this variable before the inherit line, to the datestamp of the ljr
# patchset.

# @ECLASS-VARIABLE: UNOBTANIUMCORE_POLICY_PATCHES
# @DESCRIPTION:
# Set this variable before the inherit line, to a space-delimited list of
# supported policies.

# These are expected to change in future versions
DOCS="${DOCS} doc/README.md doc/release-notes.md"
OPENSSL_DEPEND="dev-libs/openssl:0[-bindist]"
WALLET_DEPEND="sys-libs/db:$(db_ver_to_slot "${DB_VER}")[cxx]"

case "${PV}" in
0.10*)
	UNOBTANIUMCORE_SERIES="0.10.x"
	LIBSECP256K1_DEPEND="=dev-libs/libsecp256k1-0.0.0_pre20141212"
	;;
9999*)
	UNOBTANIUMCORE_SERIES="9999"
	LIBSECP256K1_DEPEND="=dev-libs/libsecp256k1-9999"
	;;
*)
	die "Unrecognised version"
	;;
esac

MyPV="${PV/_/}"
MyPN="unobtanium"
MyP="${MyPN}-${MyPV}"
LJR_PV() { echo "${MyPV}.${1}${UNOBTANIUMCORE_LJR_DATE}"; }
LJR_PATCHDIR="${MyPN}-$(LJR_PV ljr).patches"
LJR_PATCH() { echo "${WORKDIR}/${LJR_PATCHDIR}/${MyPN}-$(LJR_PV ljr).$@.patch"; }
LJR_PATCH_DESC="http://luke.dashjr.org/programs/${MyPN}/files/${MyPN}d/luke-jr/${UNOBTANIUMCORE_SERIES}/$(LJR_PV ljr)/${MyPN}-$(LJR_PV ljr).desc.txt"

HOMEPAGE="https://github.com/unobtanium-official/Unobtanium"

if [ -z "$UNOBTANIUMCORE_COMMITHASH" ]; then
	EGIT_PROJECT='unobtanium'
	EGIT_REPO_URI="git://github.com/unobtanium-official/Unobtanium.git https://github.com/unobtanium-official/Unobtanium.git"
else
	SRC_URI="https://github.com/${MyPN}/${MyPN}/archive/${UNOBTANIUMCORE_COMMITHASH}.tar.gz -> ${MyPN}-v${PV}.tgz"
	if [ -z "${UNOBTANIUMCORE_NO_SYSLIBS}" ]; then
		SRC_URI="${SRC_URI} http://luke.dashjr.org/programs/${MyPN}/files/${MyPN}d/luke-jr/${UNOBTANIUMCORE_SERIES}/$(LJR_PV ljr)/${LJR_PATCHDIR}.txz -> ${LJR_PATCHDIR}.tar.xz"
	fi
	S="${WORKDIR}/${MyPN}-${UNOBTANIUMCORE_COMMITHASH}"
fi

IUSE="$IUSE $UNOBTANIUMCORE_IUSE"
for mypolicy in ${UNOBTANIUMCORE_POLICY_PATCHES}; do
	IUSE="$IUSE +unobtanium_policy_${mypolicy}"
done
if in_bcc_policy spamfilter; then
	REQUIRED_USE="${REQUIRED_USE} unobtanium_policy_spamfilter? ( ljr )"
fi

UNOBTANIUMCORE_COMMON_DEPEND="
	${OPENSSL_DEPEND}
	$LIBSECP256K1_DEPEND
"
if [ "${PN}" != "libunobtaniumconsensus" ]; then
	UNOBTANIUMCORE_COMMON_DEPEND=">=dev-libs/boost-1.52.0[threads(+)]"
fi
unobtaniumcore_common_depend_use() {
	in_bcc_iuse "$1" || return
	UNOBTANIUMCORE_COMMON_DEPEND="${UNOBTANIUMCORE_COMMON_DEPEND} $1? ( $2 )"
}
unobtaniumcore_common_depend_use upnp net-libs/miniupnpc
unobtaniumcore_common_depend_use wallet "${WALLET_DEPEND}"
unobtaniumcore_common_depend_use zeromq net-libs/zeromq
RDEPEND="${RDEPEND} ${UNOBTANIUMCORE_COMMON_DEPEND}"
DEPEND="${DEPEND} ${UNOBTANIUMCORE_COMMON_DEPEND}
	>=app-shells/bash-4.1
	sys-apps/sed
"

unobtaniumcore_policymsg() {
	local USEFlag="unobtanium_policy_$1"
	in_iuse "${USEFlag}" || return
	if use "${USEFlag}"; then
		[ -n "$2" ] && einfo "$2"
	else
		[ -n "$3" ] && einfo "$3"
	fi
	unobtaniumcore_policymsg_flag=true
}

unobtaniumcore_pkg_pretend() {
	unobtaniumcore_policymsg_flag=false
	if use_if_iuse ljr || use_if_iuse 1stclassmsg || use_if_iuse zeromq; then
		einfo "Extra functionality improvements to Unobtanium Core are enabled."
		unobtaniumcore_policymsg_flag=true
	fi
	unobtaniumcore_policymsg cpfp \
		"CPFP policy is enabled: If you mine, you will give consideration to child transaction fees to pay for their parents." \
		"CPFP policy is disabled: If you mine, you will ignore transactions unless they have sufficient fee themselves, even if child transactions offer a fee to cover their cost."
	unobtaniumcore_policymsg dcmp \
		"Data Carrier Multi-Push policy is enabled: Your node will assist transactions with at most a single multiple-'push' data carrier output." \
		"Data Carrier Multi-Push policy is disabled: Your node will assist transactions with at most a single data carrier output with only a single 'push'."
	unobtaniumcore_policymsg spamfilter \
		"Enhanced spam filter policy is enabled: Notorious spammers will not be assisted by your node. This may impact your ability to use some spammy services (see link for a list)." \
		"Enhanced spam filter policy is DISABLED: Your node will not be checking for notorious spammers, and may assist them. Set UNOBTANIUM_POLICY=spamfilter to enable."
	$unobtaniumcore_policymsg_flag && einfo "For more information on any of the above, see ${LJR_PATCH_DESC}"
}

unobtaniumcore_prepare() {
	if [ -n "${UNOBTANIUMCORE_NO_SYSLIBS}" ]; then
		true
	elif [ "${PV}" = "9999" ]; then
		epatch "${FILESDIR}/0.9.0-sys_leveldb.patch"
		# Temporarily use embedded secp256k1 while API is in flux
		#epatch "${FILESDIR}/${PV}-sys_libsecp256k1.patch"
	else
		epatch "$(LJR_PATCH syslibs)"
	fi
	if use_if_iuse ljr; then
		epatch "$(LJR_PATCH ljrF)"
	fi
	if use_if_iuse 1stclassmsg; then
		epatch "$(LJR_PATCH 1stclassmsg)"
	fi
	use_if_iuse zeromq && epatch "$(LJR_PATCH zeromq)"
	for mypolicy in ${UNOBTANIUMCORE_POLICY_PATCHES}; do
		use unobtanium_policy_${mypolicy} && epatch "$(LJR_PATCH ${mypolicy})"
	done
}

unobtaniumcore_autoreconf() {
	eautoreconf
	rm -r src/leveldb || die
	
	# Temporarily using embedded secp256k1 for 9999 while API is in flux
	if [ "${PV}" != "9999" ]; then
		rm -r src/secp256k1 || die
	fi
}

unobtaniumcore_src_prepare() {
	 unobtaniumcore_prepare
	 unobtaniumcore_autoreconf
}

unobtaniumcore_conf() {
	local my_econf=
	if use_if_iuse upnp; then
		my_econf="${my_econf} --with-miniupnpc --enable-upnp-default"
	else
		my_econf="${my_econf} --without-miniupnpc --disable-upnp-default"
	fi
	if use_if_iuse test; then
		my_econf="${my_econf} --enable-tests"
	else
		my_econf="${my_econf} --disable-tests"
	fi
	if use_if_iuse wallet; then
		my_econf="${my_econf} --enable-wallet"
	else
		my_econf="${my_econf} --disable-wallet"
	fi
	if [ -z "${UNOBTANIUMCORE_NO_SYSLIBS}" ] && [ "${PV}" != "9999" ]; then
		my_econf="${my_econf} --disable-util-cli --disable-util-tx"
	else
		my_econf="${my_econf} --without-utils"
	fi
	econf \
		--disable-ccache \
		--with-system-leveldb       \
		--with-system-libsecp256k1  \
		--without-libs    \
		--without-daemon  \
		--without-gui     \
		${my_econf}  \
		"$@"
}

unobtaniumcore_src_test() {
	emake check
}

unobtaniumcore_src_install() {
	default
	[ "${PN}" = "libunobtaniumconsensus" ] || rm "${D}/usr/bin/test_unobtanium"
}

_UNOBTANIUMCORE_ECLASS=1
fi

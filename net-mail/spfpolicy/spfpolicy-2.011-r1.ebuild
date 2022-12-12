# cribbed from http://www.exonotes.com/node/71

EAPI="7"

inherit eutils 

DESCRIPTION="Postfix policy server implementing Sender Policy Framework (SPF)"
HOMEPAGE="http://www.openspf.org/Software"
SRC_URI="http://launchpad.net/postfix-policyd-spf-perl/trunk/${PV}/+download/postfix-policyd-spf-perl-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa ~ppc ppc64 x86"

DEPEND=""
RDEPEND=">=dev-lang/perl-5.6.0
	>=dev-perl/Mail-SPF-2.006
	dev-perl/NetAddr-IP
	dev-perl/Sys-Hostname-Long
	acct-user/spfpolicy
	acct-group/spfpolicy"

# Unfortunately our tar file uses a long name, so we have to set the
# source directory here.
S="${WORKDIR}/postfix-policyd-spf-perl-${PV}"

pkg_setup() {
	# Add a new unprivileged user and group for the service
        enewgroup ${PN}
        enewuser ${PN} -1 -1 /dev/null ${PN}
}

src_install() {
	# Install the script to /usr/sbin/spfpolicy
	newsbin postfix-policyd-spf-perl spfpolicy

	# Install the docs
	dodoc CHANGES INSTALL LICENSE README
}

pkg_postinst() {
	elog "To use SPF filtering, edit your postfix configuration files:"
	elog "/etc/postfix/master.cf:"
	elog "spfpolicy  -	n	n	-	0	spawn"
	elog "    user=spfpolicy argv=/usr/sbin/spfpolicy"
	elog
	elog "/etc/postfix/main.cf:"
	elog "    smtpd_recipient_restrictions="
	elog "        ..."
	elog "        reject_unauth_destination,"
	elog "        check_policy_service unix:private/spfpolicy"
	elog
	elog "For more information see the INSTALL doc."
}

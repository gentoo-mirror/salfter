EAPI=7

inherit acct-user

DESCRIPTION="User for net-mail/spfpolicy"
ACCT_USER_ID=995
ACCT_USER_GROUPS=( spfpolicy )

acct-user_add_deps

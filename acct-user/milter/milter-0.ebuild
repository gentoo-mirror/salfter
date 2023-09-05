EAPI=8

inherit acct-user

DESCRIPTION="User for mail-filter/hashcash-milter"
ACCT_USER_ID=992
ACCT_USER_GROUPS=( milter )
ACCT_USER_HOME=/var/lib/milter

acct-user_add_deps

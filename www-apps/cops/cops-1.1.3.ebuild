EAPI=8

inherit webapp

DESCRIPTION="Calibre OPDS PHP Server"
HOMEPAGE=https://blog.slucas.fr/projects/calibre-opds-php-server/
SRC_URI="https://github.com/seblucas/$PN/archive/$PV.tar.gz -> $P.tar.gz"

LICENSE=GPL-2
KEYWORDS=~amd64

RDEPEND="dev-lang/php[gd,xml,intl,json,sqlite]"

src_install()
{
	webapp_src_preinst

	insinto $MY_HTDOCSDIR
	doins -r .

	webapp_postinst_txt en $FILESDIR/postinstall.txt

	webapp_src_install
}

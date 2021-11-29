EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} pypy3)

inherit distutils-r1

DESCRIPTION="YAML parser and emitter for Python"
HOMEPAGE="https://pyyaml.org"
SRC_URI="https://github.com/yaml/pyyaml/archive/refs/tags/$PV.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

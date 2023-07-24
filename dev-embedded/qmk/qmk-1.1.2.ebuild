EAPI=8
PYTHON_COMPAT=( python3_{8..12} pypy3 ) 

inherit distutils-r1 pypi

DESCRIPTION="A program to help users work with QMK Firmware"
HOMEPAGE="https://github.com/qmk/qmk_cli"
DISTUTILS_USE_PEP517=setuptools

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/milc
	 dev-python/argcomplete
	 dev-python/halo
	 dev-python/hid
	 dev-python/hjson
	 dev-python/qmk-dotty-dict
	 dev-python/pyusb
	 dev-python/jsonschema
	 dev-python/pillow
	 dev-python/pygments
	 dev-python/pyserial
	 dev-python/appdirs
	 cross-arm-none-eabi/gcc
	 cross-arm-none-eabi/newlib[nano]
	 cross-avr/gcc
	 dev-embedded/avrdude
	 dev-embedded/dfu-programmer
	 app-mobilephone/dfu-util"
DEPEND=""


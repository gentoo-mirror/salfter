EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/trezor"
GOLANG_PKG_VERSION="d0b5fb041d2a8e5be35899655949e154b3b7845b"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/gorilla/csrf:79c60d0" # 1.7.0
	"github.com/gorilla/handlers:d453eff" # 1.5.1
	"github.com/gorilla/mux:98cb6bf" # 1.8.0
	"github.com/gorilla/securecookie:e59506c" # 1.1.1
	"github.com/felixge/httpsnoop:33ec42c" # 1.0.1
	"github.com/pkg/errors:614d223" # 0.9.1
	"github.com/natefinch/lumberjack:dd45e6a -> gopkg.in/natefinch/lumberjack.v2" # 2.0.0
)

inherit golang-single

DESCRIPTION="Trezor Bridge"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"

GOLANG_PKG_USE_CGO=1

DEPEND="!net-p2p/trezord"

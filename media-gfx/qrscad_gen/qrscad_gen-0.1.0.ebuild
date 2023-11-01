# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	clap@3.2.20
	clap_derive@3.2.18
	clap_lex@0.2.4
	hashbrown@0.12.3
	heck@0.4.0
	hermit-abi@0.1.19
	indexmap@1.9.1
	libc@0.2.132
	once_cell@1.14.0
	os_str_bytes@6.3.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.43
	qr_code@1.1.0
	quote@1.0.21
	strsim@0.10.0
	syn@1.0.99
	termcolor@1.1.3
	textwrap@0.15.0
	unicode-ident@1.0.3
	version_check@0.9.4
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
"

inherit cargo

DESCRIPTION="qrscad_gen"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="homepage field in Cargo.toml inaccessible to cargo metadata"
SRC_URI="${CARGO_CRATE_URIS}
	 https://github.com/guivo/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 MIT Unicode-DFS-2016 Unlicense"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	CoreFoundation-sys-0.1.4
	IOKit-sys-0.1.5
	ab_glyph-0.2.17
	ab_glyph_rasterizer-0.1.7
	accesskit-0.11.0
	accesskit_consumer-0.15.0
	accesskit_macos-0.7.1
	accesskit_unix-0.5.0
	accesskit_windows-0.14.0
	accesskit_winit-0.14.1
	adler-1.0.2
	ahash-0.8.2
	aho-corasick-1.0.2
	android-activity-0.4.1
	android-properties-0.2.2
	arboard-3.2.0
	arrayref-0.3.6
	arrayvec-0.7.2
	async-broadcast-0.5.1
	async-channel-1.8.0
	async-executor-1.5.1
	async-fs-1.6.0
	async-io-1.13.0
	async-lock-2.7.0
	async-recursion-1.0.4
	async-task-4.4.0
	async-trait-0.1.68
	atk-sys-0.16.0
	atomic-waker-1.1.1
	atomic_refcell-0.1.8
	atspi-0.10.1
	atspi-macros-0.2.0
	autocfg-1.1.0
	base64-0.13.0
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.10.4
	block-sys-0.1.0-beta.1
	block2-0.2.0-alpha.6
	blocking-1.3.1
	bumpalo-3.11.0
	bytemuck-1.12.1
	bytemuck_derive-1.2.1
	byteorder-1.4.3
	bytes-1.2.1
	bzip2-0.4.3
	bzip2-sys-0.1.11+1.0.8
	cairo-sys-rs-0.16.3
	calloop-0.10.1
	cc-1.0.73
	cesu8-1.1.0
	cfg-expr-0.10.3
	cfg-if-1.0.0
	cfg_aliases-0.1.1
	cgl-0.3.2
	clipboard-win-4.4.2
	cocoa-0.24.1
	cocoa-foundation-0.1.0
	color_quant-1.1.0
	combine-4.6.6
	concurrent-queue-2.2.0
	confy-0.5.1
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	core-graphics-0.22.3
	core-graphics-types-0.1.1
	cpufeatures-0.2.7
	crc32fast-1.3.2
	crossbeam-utils-0.8.15
	crypto-common-0.1.6
	cty-0.2.2
	curl-0.4.44
	curl-sys-0.4.63+curl-8.1.2
	data-url-0.2.0
	derivative-2.2.0
	digest-0.10.6
	directories-4.0.1
	dirs-4.0.0
	dirs-sys-0.3.7
	dispatch-0.2.0
	dlib-0.5.0
	downcast-rs-1.2.0
	ecolor-0.22.0
	eframe-0.22.0
	egui-0.22.0
	egui-notify-0.7.0
	egui-winit-0.22.0
	egui_extras-0.22.0
	egui_file-0.9.0
	egui_glow-0.22.0
	emath-0.22.0
	enumflags2-0.7.7
	enumflags2_derive-0.7.7
	epaint-0.22.0
	errno-0.3.1
	errno-dragonfly-0.1.2
	error-code-2.3.1
	event-listener-2.5.3
	fastrand-1.9.0
	flate2-1.0.24
	float-cmp-0.9.0
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	futures-core-0.3.28
	futures-io-0.3.28
	futures-lite-1.13.0
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	gdk-pixbuf-sys-0.16.3
	gdk-sys-0.16.0
	generic-array-0.14.7
	gethostname-0.2.3
	getrandom-0.2.9
	gio-sys-0.16.3
	gl_generator-0.14.0
	glib-sys-0.16.3
	glow-0.12.1
	glutin-0.30.3
	glutin-winit-0.3.0
	glutin_egl_sys-0.3.1
	glutin_glx_sys-0.3.0
	glutin_wgl_sys-0.3.0
	gobject-sys-0.16.3
	gtk-sys-0.16.0
	hashbrown-0.12.3
	heck-0.4.0
	hermit-abi-0.3.1
	hex-0.4.3
	idna-0.3.0
	image-0.24.6
	imagesize-0.10.1
	indexmap-1.9.3
	instant-0.1.12
	io-lifetimes-1.0.10
	itoa-1.0.4
	jni-0.21.1
	jni-sys-0.3.0
	jobserver-0.1.26
	js-sys-0.3.60
	khronos_api-3.1.0
	kurbo-0.8.3
	lazy_static-1.4.0
	libc-0.2.141
	libloading-0.7.3
	libudev-0.3.0
	libudev-sys-0.1.4
	libusb1-sys-0.6.4
	libz-sys-1.1.9
	linux-raw-sys-0.3.3
	lock_api-0.4.8
	log-0.4.17
	mach-0.1.2
	mach-0.3.2
	malloc_buf-0.0.6
	memchr-2.5.0
	memmap2-0.5.10
	memoffset-0.6.5
	memoffset-0.7.1
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	mio-0.8.4
	ndk-0.7.0
	ndk-context-0.1.1
	ndk-sys-0.4.1+23.1.7779620
	nix-0.24.2
	nix-0.26.2
	nohash-hasher-0.2.0
	nom-7.1.1
	num-integer-0.1.45
	num-rational-0.4.1
	num-traits-0.2.15
	num_enum-0.5.7
	num_enum_derive-0.5.7
	objc-0.2.7
	objc-foundation-0.1.1
	objc-sys-0.2.0-beta.2
	objc2-0.3.0-beta.3
	objc2-encode-2.0.0-pre.2
	objc_id-0.1.1
	once_cell-1.14.0
	openssl-probe-0.1.5
	openssl-sys-0.9.88
	orbclient-0.3.44
	ordered-stream-0.2.0
	owned_ttf_parser-0.15.2
	pango-sys-0.16.3
	parking-2.1.0
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	paste-1.0.10
	percent-encoding-2.2.0
	pico-args-0.5.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	png-0.17.6
	polling-2.8.0
	ppv-lite86-0.2.17
	proc-macro-crate-1.2.1
	proc-macro2-1.0.56
	quote-1.0.26
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	raw-window-handle-0.5.0
	rctree-0.5.0
	redox_syscall-0.2.16
	redox_syscall-0.3.5
	redox_users-0.4.3
	regex-1.9.1
	regex-automata-0.3.4
	regex-syntax-0.7.4
	resvg-0.28.0
	rfd-0.11.3
	rgb-0.8.36
	roxmltree-0.15.1
	rusb-0.9.2
	rustix-0.37.13
	ryu-1.0.11
	same-file-1.0.6
	schannel-0.1.21
	scoped-tls-1.0.0
	scopeguard-1.1.0
	sctk-adwaita-0.5.4
	serde-1.0.148
	serde_derive-1.0.148
	serde_json-1.0.89
	serde_repr-0.1.12
	serde_spanned-0.6.1
	serialport-4.2.0
	sha1-0.10.5
	simple-home-dir-0.1.2
	simplecss-0.2.1
	siphasher-0.3.10
	slab-0.4.8
	slotmap-1.0.6
	smallvec-1.9.0
	smithay-client-toolkit-0.16.0
	smithay-clipboard-0.6.6
	socket2-0.4.9
	static_assertions-1.1.0
	str-buf-1.0.6
	strict-num-0.1.0
	svgtypes-0.8.2
	syn-1.0.104
	syn-2.0.15
	system-deps-6.0.2
	tempfile-3.5.0
	thiserror-1.0.40
	thiserror-impl-1.0.40
	time-0.1.44
	tiny-skia-0.8.3
	tiny-skia-path-0.8.3
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	toml-0.5.9
	toml-0.7.3
	toml_datetime-0.6.1
	toml_edit-0.19.8
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	ttf-parser-0.15.2
	typenum-1.16.0
	uds_windows-1.0.2
	unicode-bidi-0.3.8
	unicode-ident-1.0.4
	unicode-normalization-0.1.22
	url-2.3.1
	usvg-0.28.0
	vcpkg-0.2.15
	vec_map-0.8.2
	version-compare-0.1.1
	version_check-0.9.4
	waker-fn-1.1.0
	walkdir-2.3.2
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.87
	wasm-bindgen-backend-0.2.87
	wasm-bindgen-futures-0.4.33
	wasm-bindgen-macro-0.2.87
	wasm-bindgen-macro-support-0.2.87
	wasm-bindgen-shared-0.2.87
	wayland-client-0.29.5
	wayland-commons-0.29.5
	wayland-cursor-0.29.5
	wayland-protocols-0.29.5
	wayland-scanner-0.29.5
	wayland-sys-0.29.5
	wayland-sys-0.30.1
	web-sys-0.3.60
	webbrowser-0.8.9
	whoami-1.2.3
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-wsapoll-0.1.1
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.44.0
	windows-implement-0.44.0
	windows-interface-0.44.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winit-0.28.3
	winnow-0.4.1
	winresource-0.1.15
	x11-dl-2.20.0
	x11rb-0.10.1
	x11rb-protocol-0.10.0
	xcursor-0.3.4
	xdg-home-1.0.0
	xml-rs-0.8.4
	xmlparser-0.13.5
	zbus-3.12.0
	zbus_macros-3.12.0
	zbus_names-2.5.0
	zip-0.5.13
	zip-extract-0.1.1
	zvariant-3.12.0
	zvariant_derive-3.12.0
	zvariant_utils-1.0.0
"

inherit cargo

DESCRIPTION="firmware updating GUI for Pinecil soldering iron"
HOMEPAGE="https://github.com/Spagett1/PineFlash"
SRC_URI="$(cargo_crate_uris)
	 https://github.com/Spagett1/PineFlash/archive/refs/tags/$PV.tar.gz -> $P.tar.gz"
S=$WORKDIR/PineFlash-$PV
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 ISC LicenseRef-UFL-1.0 MIT MPL-2.0 OFL-1.1 Unicode-DFS-2016 Unlicense X11 ZLIB"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"
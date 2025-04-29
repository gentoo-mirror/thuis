# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from https://gitlab.com/plexvola/vaacus/-/blob/master/media-libs/libcsfml/libcsfml-2.5.ebuild

EAPI=8
inherit go-module

DESCRIPTION="A tool for exploring each layer in a docker image"
HOMEPAGE="https://github.com/wagoodman/dive"
SRC_URI="
	https://github.com/wagoodman/dive/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/emneo-dev/gentoo-deps/releases/download/dive-${PV}/dive-${PV}-deps.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT+=" test"

src_compile() {
	mkdir build || die
	go build -o build/${PN} || die
}

src_install() {
	dobin build/${PN}
}

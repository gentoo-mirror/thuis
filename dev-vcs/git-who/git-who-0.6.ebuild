# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from https://gitlab.com/plexvola/vaacus/-/blob/master/media-libs/libcsfml/libcsfml-2.5.ebuild

EAPI=8
inherit go-module

DESCRIPTION=" Git blame for file trees "
HOMEPAGE="https://github.com/sinclairtarget/git-who"
SRC_URI="
	https://github.com/sinclairtarget/git-who/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/emneo-dev/gentoo-deps/releases/download/git-who-0.6/git-who-0.6-deps.tar.xz -> ${P}-deps.tar.xz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT+=" test"

src_compile() {
	go build || die
}

src_install() {
	dobin ${PN}
}

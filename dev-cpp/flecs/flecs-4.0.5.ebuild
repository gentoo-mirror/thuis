# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from https://gitlab.com/plexvola/vaacus/-/blob/master/media-libs/libcsfml/libcsfml-2.5.ebuild

EAPI=8

inherit cmake

DESCRIPTION="A fast entity component system (ECS) for C & C++"
HOMEPAGE="https://github.com/SanderMertens/flecs"
SRC_URI="https://github.com/SanderMertens/flecs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug +static +dynamic"

DOCS="README.md"

src_configure() {
    local MYCMAKEARGS=(
        -DFLECS_SHARED=$(usex dynamic)
        -DFLECS_STATIC=$(usex static)
    )

    cmake_src_configure
}

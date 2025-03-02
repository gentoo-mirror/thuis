# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from https://gitlab.com/plexvola/vaacus/-/blob/master/media-libs/libcsfml/libcsfml-2.5.ebuild

EAPI=7

inherit cmake

DESCRIPTION="C bindings for SFML"
HOMEPAGE="https://www.sfml-dev.org/ https://github.com/SFML/CSFML"
SRC_URI="https://github.com/SFML/CSFML/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc"

RDEPEND="=media-libs/libsfml-2.6.1"
DEPEND="
    ${RDEPEND}
    doc? ( app-doc/doxygen )
"

DOCS="readme.md"

src_prepare() {
    sed -i "s:DESTINATION .*:DESTINATION /usr/share/doc/${PF}:" \
        doc/CMakeLists.txt || die

    cmake_src_prepare
}

src_configure() {
    local MYCMAKEARGS=(
        -DCSFML_BUILD_DOC=$(usex doc)
    )

    cmake_src_configure
}

src_compile() {
    cmake_build
}

src_install() {
    cmake_src_install
}

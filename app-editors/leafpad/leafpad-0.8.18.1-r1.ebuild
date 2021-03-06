# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit gnome2-utils xdg-utils

DESCRIPTION="A simple GTK2 text editor"
HOMEPAGE="http://tarot.freeshell.org/leafpad/"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="emacs"

RDEPEND="
	virtual/libintl
	x11-libs/gtk+:2
"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${P}-fdo.patch
	"${FILESDIR}"/${P}-format-security.patch

	# https://bugs.gentoo.org/657462
	"${FILESDIR}"/${P}-truncate.patch
)

src_configure() {
	econf \
		--enable-chooser \
		--enable-print \
		$(use_enable emacs)
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit games eutils

DESCRIPTION="Action-adventure game set in a destructable world made of voxels"
HOMEPAGE="http://www.lexaloffle.com/voxatron.php"
SRC_URI="${PN}_${PV}_i386.tar.gz"

LICENSE="Voxatron"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
RESTRICT="fetch strip"

RDEPEND="amd64? (
	app-emulation/emul-linux-x86-sdl )"

S="${WORKDIR}"/"${PN}"
dir="${GAMES_PREFIX_OPT}"/"${PN}"

pkg_nofetch() {
	einfo "Fetch ${SRC_URI} and put it into ${DISTDIR}"
	einfo "Purchase the game from http://www.lexaloffle.com/voxatron.php"
}

src_unpack() {
	unpack "${A}"
	cd "${S}"
}

src_install() {
	insinto "${dir}"
	doins -r lib* vox.dat || die "doins failed"
	exeinto "${dir}"
	doexe vox || die "doexe failed"
	games_make_wrapper "${PN}" "${dir}/vox" "${dir}" "${dir}"
	make_desktop_entry "${PN}" "Voxatron" "${PN}" "Game;Adventure;" "Comment=Action-adventure game set in a destructable world made of voxels"
	dodoc vox.txt
	prepgamesdirs
}
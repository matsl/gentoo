# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

MODS="rssh"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for rssh"

if [[ ${PV} != 9999* ]] ; then
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

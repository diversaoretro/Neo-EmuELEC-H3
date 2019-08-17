################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="vice"
PKG_VERSION="23a2aee4cb62448a3353b5604a5e7b3c3cf42671"
PKG_SHA256="864d224d6c1828c01fa7b419508f191e16f408041abf3b052e82cd02aa02336c"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/vice-libretro"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Versatile Commodore 8-bit Emulator version 3.0"
PKG_LONGDESC="Versatile Commodore 8-bit Emulator version 3.0"

PKG_IS_ADDON="no"
PKG_TOOLCHAIN="make"
PKG_AUTORECONF="no"
PKG_BUILD_FLAGS="-lto"

make_target() {
  if [ "$ARCH" == "arm" ]; then
    CFLAGS="$CFLAGS -DARM -DALIGN_DWORD -mstructure-size-boundary=32 -mthumb-interwork -falign-functions=16 -marm"
  fi
  make EMUTYPE=x64
  make EMUTYPE=x128
  make EMUTYPE=xplus4
  make EMUTYPE=xvic
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp vice_*_libretro.so $INSTALL/usr/lib/libretro/
}

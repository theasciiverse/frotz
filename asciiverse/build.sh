#!/bin/sh
# Builds Frotz's curses interface (frotz) without sound. Linux: run inside
# alpine:3.22 for a fully static binary with ncurses linked in. macOS: run
# on the runner with CC_ARCH set to x86_64 or arm64; it links the system's
# own ncurses (wide-character capable) instead of Homebrew's, through
# asciiverse/macos-curses-config, so the binary needs nothing beyond macOS.
#   docker run --rm -v "$PWD":/src -w /src alpine:3.22 sh asciiverse/build.sh
# Leaves ./frotz.
set -eu
if [ -f /etc/alpine-release ]; then
  apk add --no-cache build-base ncurses-dev ncurses-static pkgconf git >/dev/null
  make clean >/dev/null 2>&1 || true
  make SOUND_TYPE=none LDFLAGS=-static frotz
else
  make clean >/dev/null 2>&1 || true
  make SOUND_TYPE=none CC="cc -arch $CC_ARCH" HOMEBREW_PREFIX=/nonexistent \
    CURSES_CONFIG="$PWD/asciiverse/macos-curses-config" frotz
  otool -L frotz
  if otool -L frotz | tail -n +2 | grep -v -E "^\s*/(usr/lib|System/Library)/"; then
    echo "frotz links a library outside the system" >&2; exit 1
  fi
fi
strip frotz

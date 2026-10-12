# Changes from upstream

This is the Asciiverse packaging of [Frotz](https://gitlab.com/DavidGriffith/frotz),
the Z-machine interpreter by David Griffith and contributors
(GPL-2.0-or-later), built from upstream's 2.55 tag (February 2025).
Upstream is the `upstream` remote; the `asciiverse` branch carries the
changes below.

## Code

None. Frotz is built exactly as released: the curses interface, with sound
off (`SOUND_TYPE=none`; only a few Infocom games used sound).

## Packaging (new files)

- `asciiverse/build.sh`: a fully static Linux build in Alpine, and macOS
  builds that link only the system's ncurses (the script fails otherwise).
- `asciiverse/macos-curses-config`: stands in for Homebrew's
  ncurses6-config so the macOS build uses /usr/lib/libncurses.
- `asciiverse/nfpm.yaml`: .deb, .rpm, .apk and Arch packages named
  `frotz-asciiverse` (they conflict with a distribution's own frotz).
- `.github/workflows/release.yml`: builds all of it on a tag.

## Not built

- Windows: Frotz's curses interface is for Unix terminals.
- dfrotz and sfrotz (the dumb and SDL interfaces).

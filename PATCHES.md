# Changes from upstream

This is the Asciiverse packaging of [Frotz](https://gitlab.com/DavidGriffith/frotz),
the Z-machine interpreter by David Griffith and contributors
(GPL-2.0-or-later), built from upstream's 2.55 tag (February 2025).
Upstream is the `upstream` remote; the `asciiverse` branch carries the
changes below.

## Code

Frotz is built from the release with the curses interface and sound off
(`SOUND_TYPE=none`; only a few Infocom games used sound), plus one fix:

- `src/curses/ux_blorb.c`: when a story is a bare Z-code file, Frotz builds
  the name of a companion Blorb file by copying the story's file name with
  `memcpy` of the longer, extended length, reading past the end of the name
  and leaving the copy without its terminating zero. With a long enough path
  this corrupted the heap, and the static musl build stopped with "Illegal
  instruction" before the first screen (found with Curses, installed by av
  under ~/.local/share/asciiverse/adventures/curses/; AddressSanitizer
  reports a heap-buffer-overflow at line 100). Now a plain `strcpy` and
  `strcat`. Still present on upstream master as of 2026-10-12.

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

## Ours

- **How to play it, at the top of README.md.** A short note on installing and
  starting it with av, or from a release archive; the original text follows
  unchanged.

# Frotz (Asciiverse packaging)

Frotz, the Z-machine interpreter, packaged for the Asciiverse catalog (kind
`program`, an interpreter for the Text adventures category) and as system
packages. Story titles such as Zork bundle this build with their story
file. Not our code: keep changes small, list every one in PATCHES.md.

- Remotes: `upstream` is gitlab.com/DavidGriffith/frotz, `origin` is
  github.com/theasciiverse/frotz.
- Branch `asciiverse` = an upstream release tag plus our commits.
- Release: tag `v<upstream version>-av.<n>` and push it.
- Local static build: `docker run --rm -v "$PWD":/src -w /src alpine:3.22
  sh asciiverse/build.sh` leaves `./frotz`.
- Play: `frotz <story file>`.

[![Build TeX PDFs](https://github.com/Jack-Lab-at-EIT/agent-seminar-2026Fall/actions/workflows/tex-build-release.yml/badge.svg)](https://github.com/Jack-Lab-at-EIT/agent-seminar-2026Fall/actions/workflows/tex-build-release.yml)

## Structure

Source code: `src/*.tex`; artifacts: `build/`.

## PDFs

Get built PDFs from Releases (tags like `2026-09-13`).

## Build

```shell
nix develop ./nix --command bash -c 'for f in src/*.tex; do latexmk "$f"; done'
```

## Release

```shell
git tag 2026-09-13 && git push origin 2026-09-13
```

## Clean

```shell
latexmk -c src/syllabus.tex
```

or just `rm -r build/`;

# homebrew-zerminal

Homebrew tap for [Zerminal](https://github.com/elleryfamilia/zerminal), a terminal-first IDE for agentic coding (Zed fork).

## Install

```bash
brew install --cask elleryfamilia/zerminal/zerminal
```

Or, after `brew tap elleryfamilia/zerminal`:

```bash
brew install --cask zerminal
```

## Updating

```bash
brew upgrade --cask zerminal
```

The cask is auto-bumped from `elleryfamilia/zerminal`'s release pipeline on every tagged release.

## Platform support

Apple Silicon (`arm64`) only. Intel Macs aren't built; build from source against the main repo.

## Signing key

Linux packages on `elleryfamilia/zerminal` releases are GPG-signed. The fingerprint is published in three places — they must agree, otherwise don't install:

- `elleryfamilia/zerminal/SECURITY.md`
- This README (below)
- `keys.openpgp.org` — search `ellery@familia.me`

**Fingerprint:** `<FILL IN — run: gpg --fingerprint ellery@familia.me>`

## License

MIT — see [LICENSE](./LICENSE).

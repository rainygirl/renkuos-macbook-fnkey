# MacBook FnKey for RenkuOS

[English](README.md) · [한국어](README.ko.md) · [日本語](README.ja.md)

Function keys for the 2010 MacBook7,1 with the built-in ANSI keyboard
(USB 05ac:0236): brightness, workspaces, media and volume on F1-F12, with
Fn + F1-F12 giving the ordinary function keys. Brightness uses a native MCP89
backlight driver, so nouveau is not required. This is not a graphics driver.

## Install

```sh
pkgman add-repo https://pkgman.rainygirl.com/x86_64
pkgman refresh
pkgman install macbook_fnkey
```

Restart afterwards. Skip `add-repo` if the repository is already configured.
Haiku package names cannot contain hyphens, so the install name is
`macbook_fnkey`.

Requires x86_64 RenkuOS `r1~beta6_hrev60072_269_dirty` exactly; other system
builds need matching binaries. ISO/JIS keyboards and other Mac models are not
supported.

If you previously installed the manual test binaries under
`~/config/non-packaged`, those files take precedence over packaged ones. Move
only those test files out before installing; see [migration.md](migration.md).
New installations do not need this step.

## Remove

```sh
pkgman uninstall macbook_fnkey
```

Restart afterwards. Removal restores the packaged system drivers. Neither
installing nor removing restarts the system for you.

## License

MIT, see [LICENSE](LICENSE). Existing Haiku copyright notices are preserved.

## AI disclosure

Parts of MacBook FnKey were developed with the assistance of an AI coding tool
(OpenAI Codex). All code has been reviewed and tested by the author.

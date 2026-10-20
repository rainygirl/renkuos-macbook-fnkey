#!/bin/sh
# Run on the matching x86_64 RenkuOS system with native package tools.
set -eu
HERE=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
BIN=${1:?directory containing smbios, usb_hid, mcp89_backlight, macbook71_keys}
VERSION=r1~beta6_hrev60072_269_dirty
package list /boot/system/packages/haiku-*.hpkg | grep -F "version: $VERSION-1" >/dev/null
[ "$(uname -m)" = x86_64 ]
STAGE=$(mktemp -d /tmp/macbook-fnkey.XXXXXX)
trap 'rm -rf "$STAGE"' EXIT HUP INT TERM
mkdir -p "$STAGE/add-ons/kernel/generic" "$STAGE/add-ons/kernel/drivers/bin" \
 "$STAGE/add-ons/kernel/drivers/dev/input" "$STAGE/add-ons/kernel/drivers/dev/power" \
 "$STAGE/add-ons/input_server/filters" "$STAGE/documentation/packages/macbook-fnkey"
# Preserve metadata of existing system modules, then replace their contents.
for entry in generic/smbios drivers/bin/usb_hid; do
 cp -p "/boot/system/add-ons/kernel/$entry" "$STAGE/add-ons/kernel/$entry"
 cat "$BIN/${entry##*/}" > "$STAGE/add-ons/kernel/$entry"
done
cp "$BIN/mcp89_backlight" "$STAGE/add-ons/kernel/drivers/bin/"
cp "$BIN/macbook71_keys" "$STAGE/add-ons/input_server/filters/"
chmod 755 "$STAGE/add-ons/kernel/generic/smbios" "$STAGE/add-ons/kernel/drivers/bin/"* "$STAGE/add-ons/input_server/filters/macbook71_keys"
touch "$STAGE/add-ons/kernel/generic/smbios" "$STAGE/add-ons/kernel/drivers/bin/"* "$STAGE/add-ons/input_server/filters/macbook71_keys"
ln -s ../../bin/usb_hid "$STAGE/add-ons/kernel/drivers/dev/input/usb_hid"
ln -s ../../bin/mcp89_backlight "$STAGE/add-ons/kernel/drivers/dev/power/mcp89_backlight"
cp "$HERE/README"*.md "$HERE/migration.md" "$HERE/macbook71-function-keys.patch" "$STAGE/documentation/packages/macbook-fnkey/"
cp -R "$HERE/package" "$STAGE/documentation/packages/macbook-fnkey/"
cat > "$STAGE/.PackageInfo" <<EOF
name macbook_fnkey
version 1.0.0-1
architecture x86_64
summary "MacBook7,1 function keys and native MCP89 brightness control"
description "Function keys for the 2010 MacBook7,1 ANSI keyboard. Includes patched USB HID and SMBIOS modules, a native MCP89 backlight driver and an input filter. F1/F2 brightness was verified on hardware. Reboot after installation or removal. Requires the matching RenkuOS system build."
vendor rainygirl
packager "rainygirl <rainygirl@gmail.com>"
licenses { "MIT" }
copyrights { "2001-2026 Haiku, Inc. et al" "2026 rainygirl" }
provides { macbook_fnkey = 1.0.0 }
requires { haiku == $VERSION }
flags { system_package }
EOF
mkdir -p "$HERE/dist"
package create -C "$STAGE" "$HERE/dist/macbook_fnkey-1.0.0-1-x86_64.hpkg"
package list "$HERE/dist/macbook_fnkey-1.0.0-1-x86_64.hpkg"
sha256sum "$HERE/dist/macbook_fnkey-1.0.0-1-x86_64.hpkg"

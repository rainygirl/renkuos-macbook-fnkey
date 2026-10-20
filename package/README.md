# Build

Apply `../macbook71-function-keys.patch` to RenkuOS/Source commit
`e66eeecd57a93afd573c15cdf78d788e68d6c09d` in a separate source tree.
In its configured x86_64 build directory, run:

```sh
jam -q -j4 smbios usb_hid i2c_hid mcp89_backlight macbook71_keys
```

Collect `smbios`, `usb_hid`, `mcp89_backlight`, and `macbook71_keys` from
`objects/haiku/x86_64/release/add-ons/` into one binary directory.
On x86_64 RenkuOS `r1~beta6_hrev60072_269_dirty-1`, run:

```sh
sh package/build.sh /path/to/binaries
```

The resulting `dist/macbook_fnkey-1.0.0-1-x86_64.hpkg` is a system package,
with an exact base-system dependency. Newer module timestamps make packagefs
select these modules over the base package. Removing it restores base files.
No install script edits the boot script or automatically restarts input_server.
Reboot after installation/removal. Other system builds require a rebuild and
validation before changing the dependency.

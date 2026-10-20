# 수동 시험판에서 전환 / Migrating manual test files / 手動テスト版からの移行

일반적인 새 설치에는 필요하지 않습니다. 이전 시험판을 수동 설치한 기기에서만
아래 경로를 확인하고, 시험용 파일인 것을 확인한 뒤 별도 백업 폴더로 옮기세요.
다른 드라이버나 Wi-Fi 파일은 옮기지 마세요. 패키지를 설치하고 재부팅합니다.

Only for machines with the earlier manual test installation: inspect these
paths, verify they are the test files, and move them to a separate backup
folder. Leave unrelated drivers and Wi-Fi files in place. Install the package
and restart.

以前の手動テスト版を入れた機器のみ対象です。以下のパスを確認し、テスト用
ファイルであることを確かめてから別のバックアップフォルダーへ移動します。
他のドライバーや Wi-Fi ファイルは移動しないでください。パッケージを
インストールして再起動します。

Paths relative to `~/config/non-packaged/add-ons/`:

- `kernel/generic/smbios`
- `kernel/drivers/bin/usb_hid`
- `kernel/drivers/dev/input/usb_hid` (symlink)
- `kernel/drivers/bin/mcp89_backlight`
- `kernel/drivers/dev/power/mcp89_backlight` (symlink)
- `input_server/filters/macbook71_keys`

The package does not delete these files automatically. Leaving them in place
can mask package updates and keep the manual version active after uninstalling.

# RenkuOS 用 MacBook FnKey

[English](README.md) · [한국어](README.ko.md) · [日本語](README.ja.md)

2010 年の MacBook7,1 の内蔵 ANSI キーボード (USB 05ac:0236) 用のファンクション
キーです。F1〜F12 に明るさ・ワークスペース・メディア・音量を割り当て、
Fn + F1〜F12 は通常のファンクションキーになります。明るさは MCP89 ネイティブ
バックライトドライバを使うため nouveau は不要です。グラフィックスドライバでは
ありません。

## インストール

```sh
pkgman add-repo https://pkgman.rainygirl.com/x86_64
pkgman refresh
pkgman install macbook_fnkey
```

インストール後に再起動してください。リポジトリが登録済みなら `add-repo` は
不要です。Haiku のパッケージ名にハイフンは使えないため、インストール名は
`macbook_fnkey` です。

x86_64 RenkuOS `r1~beta6_hrev60072_269_dirty` 専用です。他のシステムビルドには
対応するバイナリが必要です。ISO/JIS キーボードと他の Mac モデルには対応して
いません。

以前 `~/config/non-packaged` に手動のテストバイナリを置いた場合、そのファイルが
パッケージより優先されます。インストール前にそのテストファイルだけ移動して
ください。[migration.md](migration.md) を参照してください。新規インストールでは
不要です。

## アンインストール

```sh
pkgman uninstall macbook_fnkey
```

削除後に再起動してください。削除するとパッケージ標準のドライバに戻ります。
インストールも削除も自動では再起動しません。

## ライセンス

MIT、[LICENSE](LICENSE) を参照。既存の Haiku の著作権表示は維持しています。

## AI の利用について

MacBook FnKey の一部は AI コーディングツール (OpenAI Codex) の支援を受けて
開発されました。すべてのコードは作者がレビューし、テストしています。

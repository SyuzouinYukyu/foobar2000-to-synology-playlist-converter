# foobar2000 to Synology Playlist Converter

foobar2000 で作成したプレイリストを、Synology NAS / UPnP / DLNA 環境で扱いやすい形式へ変換する Windows 向け GUI ツールです。

本ツールは、Windows 上の foobar2000 プレイリストを NAS 側のパス体系へ合わせることを目的としています。特に、PC 上では再生できるが NAS / Synology 側ではパス解決できない `.m3u` / `.m3u8` プレイリストを整理する用途に向きます。

## 配布形式

- 配布版: `foobar2000_to_Synology_Playlist_Converter_v1.1.2.exe`
- 対応OS: Windows 10 / Windows 11 64bit 想定
- 形式: 単体EXE / GUIアプリ
- インストール: 不要

> GitHub の通常リポジトリには 100MiB を超えるファイルを直接置けないため、EXE本体は **GitHub Releases の Assets** から配布してください。

## 主な用途

- foobar2000 で作成したプレイリストを Synology NAS 向けに変換
- Windows ローカルパスから NAS 基準パスへの置換
- `.m3u` / `.m3u8` 系プレイリストの整理
- 変換ログの確認
- NAS 上の音楽ライブラリ運用補助

## 基本的な使い方

1. `foobar2000_to_Synology_Playlist_Converter_v1.1.2.exe` をダウンロードします。
2. 任意の作業フォルダへ配置します。
3. EXEを起動します。
4. 変換元プレイリストを指定します。
5. Windows 側の音源ルートと NAS 側の基準パスを指定します。
6. 出力先を指定して変換します。
7. 変換結果とログを確認します。

詳細は [`docs/USAGE.md`](docs/USAGE.md) を参照してください。

## NAS基準パスについて

「NAS基準」には、Synology / UPnP / DLNA 側から見た音源ライブラリの基準パスを入力します。

例:

```text
/volume1/music
/volume1/AMZN_01
/volume1/AMZN_02
```

Windows側のパス例:

```text
G:\AMZN_01
G:\AMZN_02
```

変換後は、Windows専用の `G:\...` 形式ではなく、NAS側で解釈しやすいパス形式へ寄せます。

## ハッシュ確認

配布ファイルの SHA-256 は次の通りです。

```text
382ad84f1ce70c9d36af9bd37e37c08e0bf4390901b87dcf3c5d7245fdaf16d4  foobar2000_to_Synology_Playlist_Converter_v1.1.2.exe
```

PowerShell で確認する場合:

```powershell
Get-FileHash -Algorithm SHA256 .\foobar2000_to_Synology_Playlist_Converter_v1.1.2.exe
```

## 注意事項

- 本ツールはプレイリスト変換支援ツールです。音源ファイル本体の移動・削除・変換を目的としたものではありません。
- 初回利用時は、必ず小さなテスト用プレイリストで変換結果を確認してください。
- 既存プレイリストは事前にバックアップしてください。
- EXEはコード署名されていません。Windows SmartScreen が警告を出す場合があります。
- セキュリティソフトによる検査結果は環境により異なります。利用前に各自の環境でスキャンしてください。

## 開発・動作確認環境

本ツールは、以下の環境を主な想定環境として開発・確認しています。

- スマートフォンアプリ: BubbleUPnP 有償版
- NAS: Synology DiskStation DS224+
- アンプ / ネットワークプレーヤー: Marantz MODEL M1
- 利用形態: Synology NAS上の音楽ライブラリを、UPnP / DLNA / OpenHome系の再生環境で扱う構成

上記は開発者環境であり、すべてのNAS、再生アプリ、ネットワークプレーヤーでの動作を保証するものではありません。

## ライセンス

このリポジトリに含まれる文書と配布物の扱いは [`LICENSE.txt`](LICENSE.txt) を確認してください。

## サポート

不具合報告時は、次の情報を添えて Issue を作成してください。

- Windows のバージョン
- ツールのバージョン
- 変換元プレイリストの文字コード / 拡張子
- Windows側の基準パス
- NAS側の基準パス
- 期待した出力
- 実際の出力
- 個人情報・非公開パスを伏せたログ

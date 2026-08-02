# foobar2000 to Synology Playlist Converter

foobar2000のWindows用プレイリストをSynology NAS向けへ変換し、逆方向にも変換できるWindows GUIツールです。

## 最新版

現在の公開ソース／配布版は **v1.1.5** です。

- 対応OS: Windows 10 / 11 64bit
- 形式: win-x64、自己完結、単一EXE
- インストール: 不要
- .NETランタイムの別途導入: 不要

### 配布EXE

| 項目 | 値 |
|---|---|
| ファイル名 | `foobar2000_to_Synology_Playlist_Converter_v1.1.5.exe` |
| サイズ | `161,791,256 bytes` |
| SHA-256 | `D11F847B9CAEFA27CA34E1D6682D2B7CFB1EEC3B47A6CDDDF477A3A91F4D9FCE` |

EXEは100MiBを超えるため、通常のGitリポジトリには含めていません。配布する場合はGitHub ReleasesのAssetsを使用してください。

## v1.1.5の主な機能

- Windows → NAS: UTF-8（BOMなし）/ CRLF / `#EXTM3U`
- NAS → Windows: CP932（Shift_JIS）/ CRLF / `#EXTM3U`
- Windowsドライブ、UNCパス、Synology内部パスのマッピング
- NAS上の最終配置先を基準にした相対パス生成
- ファイル存在確認、詳細ログ、CSV
- 高信頼候補だけを対象とする自動パス修復
- `RESOLVED` / `AMBIGUOUS` / `MISSING` / `NOT_CHECKABLE`分類
- 未解決行のコメントアウト
- 原子的な出力とキャンセル時の一時ファイル清掃
- ドラッグ＆ドロップ、設定保存、可変フォント
- `--self-test`内蔵

## 自動修復の安全設計

v1.1.5では、フォルダ改名の合意根拠を**正規化後のファイル名と拡張子が一致する曲**に限定しています。トラック番号だけの一致では修復しません。

フォルダ対応は、最低3曲、80%以上、候補一意、競合なしの場合だけ登録します。また、アクセス拒否、I/O障害、UNC/NAS切断、キャンセルなどで走査が完了しなかったルートの索引は破棄され、そのルートでは自動修復を行いません。

推奨設定:

```text
パス修復                 : 高信頼候補のみ自動修復
未解決行をコメントアウト : ON
```

## 公開ソース

v1.1.5の公開ソースは次にあります。

- [`source/v1.1.5`](source/v1.1.5/README.md)

ソースZIPはGitHub上でBase64テキスト11分割として保存しており、付属のPowerShellスクリプトで復元できます。復元後はSHA-256を自動検証します。

ソースZIPのSHA-256:

```text
804ad909f1bce195db7a58eb039cb4e04e697fab64b90997095788f652b88a1f
```

## SHA-256確認

```powershell
Get-FileHash -Algorithm SHA256 .\foobar2000_to_Synology_Playlist_Converter_v1.1.5.exe
```

期待値:

```text
D11F847B9CAEFA27CA34E1D6682D2B7CFB1EEC3B47A6CDDDF477A3A91F4D9FCE
```

## 注意事項

- 音源ファイル本体は移動・改名・削除しません。
- 初回は小規模なプレイリストで変換結果を確認してください。
- 既存プレイリストを事前にバックアップしてください。
- 初回運用では`RESOLVED`の旧パスと修復後パスを数件確認してください。
- EXEはコード署名されていません。SmartScreen警告が出る場合があります。
- ログをIssueへ添付する際は、個人名、非公開パス、NAS名、IPアドレス、資格情報を伏せてください。

## 開発・動作確認環境

- Synology DiskStation DS224+
- BubbleUPnP
- Marantz MODEL M1
- Windows 11 x64

上記以外のNAS、再生アプリ、ネットワークプレーヤーでの動作を保証するものではありません。

## ライセンス

利用条件は[`LICENSE.txt`](LICENSE.txt)を確認してください。

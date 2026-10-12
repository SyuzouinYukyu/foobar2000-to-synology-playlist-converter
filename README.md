# foobar2000 to Synology Playlist Converter

foobar2000で作成したWindows用プレイリストをSynology NAS向けへ変換し、逆方向にも変換できるWindows GUIツールです。

## 最新版

現在の公開版は **v1.2.2** です。

- [v1.2.2 Release](https://github.com/SyuzouinYukyu/foobar2000-to-synology-playlist-converter/releases/tag/v1.2.2)
- [取扱説明書](docs/FTSPC_Manual.html)

- 対応OS: Windows 10 / 11 64bit
- 形式: win-x64 / 自己完結 / 単一EXE
- インストール: 不要
- .NETランタイムの別途導入: 不要

### 配布EXE

| 項目 | 値 |
|---|---|
| ファイル名 | `foobar2000_to_Synology_Playlist_Converter_v1.2.2.exe` |
| サイズ | `162,270,488 bytes` |
| SHA-256 | `CB2877B1086041EBF552B93F26D42BE51E21D19AF007E1CACD0D6A3A3CD3AFE5` |

EXEは100MiBを超えるため通常のGitリポジトリには含めていません。配布EXEはGitHub ReleasesのAssetsへ登録してください。

## v1.2.2の主な更新点

- 安全性検証済みの `../` 相対M3Uパスに対応
- NAS絶対パスと相対パスを同じM3U内で混在可能
- NAS → Windows逆変換を新しいパス形式へ対応
- 複数プレイリストの一括診断・一括変換と強制変換
- `.m3u` / `.m3u8`の入力拡張子を維持

## 主な機能

- Windows → NAS: UTF-8（BOMなし）/ CRLF / `#EXTM3U`
- NAS → Windows: CP932（Shift_JIS）/ CRLF / `#EXTM3U`
- `.m3u` / `.m3u8`対応
- 複数プレイリストの選択行一括診断・一括変換
- 未解決トラックを安全にスキップする強制変換
- 安全な `../` 相対パス、NAS絶対パス、両形式の混在
- `PathPair` / `PlaylistDestination` / `VisibilityRule`による設定
- Windowsドライブ、UNCパス、Synology内部パスのマッピング
- NAS上の最終配置先を基準にした相対パス生成
- 高信頼候補のみを対象とする自動パス修復
- `解決済み` / `候補複数` / `未発見` / `確認不能` の分類
- 未解決行のコメントアウト
- 原子的なプレイリスト出力・設定保存
- EXE同一ディレクトリへのポータブル設定保存
- `<EXE directory>\logs`への詳細日本語ログ
- ドラッグ＆ドロップ、CSVレポート、設定Import/Export

## 自動修復の安全設計

フォルダ改名の合意根拠は、正規化後の**ファイル名と拡張子が一致する曲**に限定しています。トラック番号だけの一致では修復しません。

フォルダ対応は、最低3曲・80%以上・候補一意・競合なしの場合だけ登録します。アクセス拒否、I/O障害、UNC/NAS切断、キャンセル等で走査が完了しなかったルートの索引は破棄し、そのルートでは自動修復を行いません。

推奨設定:

```text
パス修復                 : 高信頼候補のみ自動修復
未解決行をコメントアウト : ON
```

## 公開ソース

v1.2.2の公開ソース:

- [`source/v1.2.2`](source/v1.2.2/README.md)

公開用ソースZIPのSHA-256:

```text
CE99702B3E166D62C7176657438972869629B0AB234C71AD3CBFE75C4270626A
```

## SHA-256確認

```powershell
Get-FileHash -Algorithm SHA256 .\foobar2000_to_Synology_Playlist_Converter_v1.2.2.exe
```

期待値:

```text
CB2877B1086041EBF552B93F26D42BE51E21D19AF007E1CACD0D6A3A3CD3AFE5
```

## 自己テスト

```powershell
.\foobar2000_to_Synology_Playlist_Converter_v1.2.2.exe --self-test
```

正常終了時は `SELF_TEST_OK` が出力されます。

## 注意事項

- 音源ファイル本体は移動・改名・削除しません。
- 初回は小規模なプレイリストで変換結果を確認してください。
- 既存プレイリストを事前にバックアップしてください。
- EXEはコード署名されていません。SmartScreen警告が出る場合があります。
- Issueへログを添付する際は、個人情報、非公開パス、NAS名、IPアドレス、資格情報を伏せてください。

## 開発・動作確認環境

- Windows 11 x64
- Synology DiskStation DS224+
- BubbleUPnP
- Marantz MODEL M1

上記以外のNAS、再生アプリ、ネットワークプレーヤーでの動作を保証するものではありません。

## ライセンス

利用条件は[`LICENSE.txt`](LICENSE.txt)を確認してください。

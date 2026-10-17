# foobar2000 to Synology Playlist Converter

foobar2000で作成したWindows用プレイリストをSynology NAS向けへ変換し、逆方向にも変換できるWindows GUIツールです。

## 最新版

現在の公開版は **v1.2.3** です。

- [v1.2.3 Release](https://github.com/SyuzouinYukyu/foobar2000-to-synology-playlist-converter/releases/tag/v1.2.3)
- [取扱説明書](docs/FTSPC_Manual.html)

- 対応OS: Windows 10 / 11 64bit
- 形式: win-x64 / 自己完結 / 単一EXE
- インストール: 不要
- .NETランタイムの別途導入: 不要

### 配布EXE

| 項目 | 値 |
|---|---|
| ファイル名 | `FTSPC_v1.2.3.exe` |
| サイズ | `162,364,440 bytes` |
| SHA-256 | `60D319078E87DB4179C93EB86CFF17EA9D19287D4E796C023ECA831F2662370F` |

EXEは100MiBを超えるため通常のGitリポジトリには含めていません。配布EXEはGitHub ReleasesのAssetsへ登録してください。

## v1.2.3の主な更新点

- 長時間処理の進捗（件数、割合、経過時間）とキャンセル中表示を改善
- メインGUI全域で`.m3u` / `.m3u8`の複数ファイルD&Dに対応
- 非対応ファイルやフォルダーのD&D時に日本語案内を表示
- PathPairの逆変換優先表示を分かりやすく変更し、旧設定互換を維持
- v1.2.2の相対/絶対パス、一括診断・変換、強制変換機能を維持

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

v1.2.3の公開ソース:

- [`source/v1.2.3`](source/v1.2.3/README.md)

公開用ソースZIPのSHA-256:

```text
A1E3C8472F872AEA195B55719A7A185063BEEBF4DDD217F15888E118F1A422FF
```

## SHA-256確認

```powershell
Get-FileHash -Algorithm SHA256 .\FTSPC_v1.2.3.exe
```

期待値:

```text
60D319078E87DB4179C93EB86CFF17EA9D19287D4E796C023ECA831F2662370F
```

## 自己テスト

```powershell
.\FTSPC_v1.2.3.exe --self-test
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

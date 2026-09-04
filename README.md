# foobar2000 to Synology Playlist Converter

foobar2000で作成したWindows用プレイリストをSynology NAS向けへ変換し、逆方向にも変換できるWindows GUIツールです。

## 最新版

現在の公開版は **v1.1.8** です。

- 対応OS: Windows 10 / 11 64bit
- 形式: win-x64 / 自己完結 / 単一EXE
- インストール: 不要
- .NETランタイムの別途導入: 不要

### 配布EXE

| 項目 | 値 |
|---|---|
| ファイル名 | `foobar2000_to_Synology_Playlist_Converter_v1.1.8.exe` |
| サイズ | `161,832,216 bytes` |
| SHA-256 | `553D7C2FAF1C31EF2D74F387BFB413762D507FFA40ADDBB37DCE2328E879E681` |

EXEは100MiBを超えるため通常のGitリポジトリには含めていません。配布EXEはGitHub ReleasesのAssetsへ登録してください。

## v1.1.8の主な更新点

- パスマッピングに「全て有効」「全て無効」を追加
- 「有効」チェックボックスを大型化し、高DPIへ追従
- ユーザー可視の状態名・ログ表記を日本語化（例: `RESOLVED` → `解決済み`）
- WinFormsレイアウトをリサイズ、DPI、フォント変更へ追従する構成へ改善
- 表示フォントを12～36ptに対応し、既定値を14ptへ変更
- 「設定保存」ボタンを廃止し、起動時自動読込・終了時自動保存へ統一
- 設定のインポート / エクスポートを維持
- `--self-test`を埋込みfixture方式へ変更し、単体EXEだけで自己テスト可能

## 主な機能

- Windows → NAS: UTF-8（BOMなし）/ CRLF / `#EXTM3U`
- NAS → Windows: CP932（Shift_JIS）/ CRLF / `#EXTM3U`
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

v1.1.8の公開ソース:

- [`source/v1.1.8`](source/v1.1.8/README.md)

公開用ソースZIPのSHA-256:

```text
77507A8BC6E697A089E08B751AF162A2170DBEE8A35454CF759E963A82FC0D7D
```

## SHA-256確認

```powershell
Get-FileHash -Algorithm SHA256 .\foobar2000_to_Synology_Playlist_Converter_v1.1.8.exe
```

期待値:

```text
553D7C2FAF1C31EF2D74F387BFB413762D507FFA40ADDBB37DCE2328E879E681
```

## 自己テスト

```powershell
.\foobar2000_to_Synology_Playlist_Converter_v1.1.8.exe --self-test
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

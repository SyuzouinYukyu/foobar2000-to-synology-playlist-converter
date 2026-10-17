# foobar2000 to Synology Playlist Converter v1.2.3

## 主な更新点

- 長時間処理の進捗表示を追加（処理内容、件数、割合、経過時間。総数不明時はMarquee）
- キャンセル中の表示が遅延進捗通知で上書きされないよう改善
- 専用ドロップ領域を廃止し、メインGUI全域で`.m3u` / `.m3u8`の複数D&Dに対応
- 非対応ファイルやフォルダーのみのD&D時に日本語案内を表示
- PathPairの「逆変換で優先」を「NAS→Windows変換時、このWindowsパスを優先」へ変更し、設定キーと旧設定互換性を維持
- v1.2.2の相対/絶対パス処理、一括診断・変換、強制変換、PathPair、PlaylistDestination、VisibilityRuleを維持

## 検証結果

- Release Build/Publish: warnings 0 / errors 0（既存結果）
- focused tests: 23成功 / 0失敗（既存結果）
- 影響するUI/batch回帰: 65成功 / 0失敗（既存結果）
- 正式EXE self-test: 19グループ成功 / 0失敗。`SELF_TEST_OK`、ExitCode 0、stderr 0 bytes
- Explorer D&D、複数プレイリスト、無効入力案内、進捗、キャンセル、17pt表示、設定復元、DPI: ユーザーWindows実機で確認済み

## 配布EXE

- ファイル: `FTSPC_v1.2.3.exe`
- サイズ: `162364440 bytes`
- SHA-256: `60D319078E87DB4179C93EB86CFF17EA9D19287D4E796C023ECA831F2662370F`
- 形式: Windows x64 / self-contained / single EXE
- コード署名: なし

## マニュアル

- [FTSPC_Manual.html](https://github.com/SyuzouinYukyu/foobar2000-to-synology-playlist-converter/blob/main/docs/FTSPC_Manual.html)
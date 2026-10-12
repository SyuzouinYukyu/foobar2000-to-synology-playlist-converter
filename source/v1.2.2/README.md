# v1.2.2 公開ソース

公開用に整えたv1.2.2ソースです。

- `AGENTS.md`、`bin`、`obj`、`publish`、ログ、設定、一時生成物は除外
- self-test用fixtureは`test_sample`として収録し、ビルド時にEXEへ埋込み

## ソースZIPの復元

GitHub上ではソースZIPを14個のBase64テキストへ分割して保存しています。

```powershell
.\Restore-SourceArchive.ps1
```

復元ファイル:

```text
foobar2000_to_Synology_Playlist_Converter_v1.2.2_source.zip
```

SHA-256:

```text
CE99702B3E166D62C7176657438972869629B0AB234C71AD3CBFE75C4270626A
```

## ビルド

復元したZIPを展開後、ソースディレクトリで実行します。

```powershell
dotnet restore .\foobar2000_to_Synology_Playlist_Converter.sln
dotnet publish .\foobar2000_to_Synology_Playlist_Converter.csproj -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -p:PublishTrimmed=false -p:DebugType=None -p:DebugSymbols=false -p:IncludeSourceRevisionInInformationalVersion=false
```

## 自己テスト

```powershell
.\foobar2000_to_Synology_Playlist_Converter_v1.2.2.exe --self-test
```

正常終了時は`SELF_TEST_OK`を出力します。

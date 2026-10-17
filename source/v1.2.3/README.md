# v1.2.3 公開ソース

公開用に整えたv1.2.3ソースです。

- `AGENTS.md`、`bin`、`obj`、`work`、`publish`、ログ、設定、一時生成物は除外
- self-test用fixtureは`test_sample`として収録し、ビルド時にEXEへ埋込み
- ソースZIP SHA-256: `A1E3C8472F872AEA195B55719A7A185063BEEBF4DDD217F15888E118F1A422FF`

## ソースZIPの復元

GitHub上ではソースZIPをBase64テキストへ分割して保存しています。

```powershell
.\Restore-SourceArchive.ps1
```

復元ファイル:

```text
foobar2000_to_Synology_Playlist_Converter_v1.2.3_source.zip
```

## ビルド

復元したZIPを展開後、ソースディレクトリで実行します。

```powershell
dotnet restore .\foobar2000_to_Synology_Playlist_Converter.sln
dotnet publish .\foobar2000_to_Synology_Playlist_Converter.csproj -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -p:PublishTrimmed=false -p:DebugType=None -p:DebugSymbols=false -p:IncludeSourceRevisionInInformationalVersion=false
```

## 自己テスト

```powershell
.\FTSPC_v1.2.3.exe --self-test
```

正常終了時は`SELF_TEST_OK`を出力します。

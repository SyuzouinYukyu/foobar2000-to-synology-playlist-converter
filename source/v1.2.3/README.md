# v1.2.3 公開ソース

公開用に整えたv1.2.3ソースです。

- AGENTS.md、in、obj、work、publish、ログ、設定、一時生成物は除外
- self-test用fixtureは	est_sampleとして収録し、ビルド時にEXEへ埋込み
- ソースZIP SHA-256: $zipHash

## ソースZIPの復元

GitHub上ではソースZIPをBase64テキストへ分割して保存しています。

`powershell
.\Restore-SourceArchive.ps1
`

復元ファイル:

`	ext
foobar2000_to_Synology_Playlist_Converter_v1.2.3_source.zip
`

## ビルド

復元したZIPを展開後、ソースディレクトリで実行します。

`powershell
dotnet restore .\foobar2000_to_Synology_Playlist_Converter.sln
dotnet publish .\foobar2000_to_Synology_Playlist_Converter.csproj -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -p:PublishTrimmed=false -p:DebugType=None -p:DebugSymbols=false -p:IncludeSourceRevisionInInformationalVersion=false
`

## 自己テスト

`powershell
.\FTSPC_v1.2.3.exe --self-test
`

正常終了時はSELF_TEST_OKを出力します。
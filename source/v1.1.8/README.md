# v1.1.8 公開ソース

公開用に整えたv1.1.8ソースです。

- `AGENTS.md`は内部作業用のため除外
- `bin` / `obj` / `publish` / logs / settings / tmp等の生成物は除外
- self-test用fixtureは`test_sample`として収録し、ビルド時にEXEへ埋込み

## ソースZIP

`foobar2000_to_Synology_Playlist_Converter_v1.1.8_source.zip`

SHA-256:

```text
77507A8BC6E697A089E08B751AF162A2170DBEE8A35454CF759E963A82FC0D7D
```

## ビルド

```powershell
dotnet restore .\foobar2000_to_Synology_Playlist_Converter.sln
dotnet build .\foobar2000_to_Synology_Playlist_Converter.sln -c Release
dotnet publish .\foobar2000_to_Synology_Playlist_Converter.csproj -c Release -r win-x64 --self-contained true
```

## 自己テスト

```powershell
.\foobar2000_to_Synology_Playlist_Converter_v1.1.8.exe --self-test
```

正常終了時は`SELF_TEST_OK`を出力します。

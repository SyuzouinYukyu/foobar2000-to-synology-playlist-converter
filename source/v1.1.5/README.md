# v1.1.5 公開ソース

配布版 `foobar2000_to_Synology_Playlist_Converter_v1.1.5.exe` に対応する公開ソース一式です。

GitHubのテキストAPI経由で確実に保存できるよう、ソースZIPをBase64テキスト11分割で収録しています。復元スクリプトは全パートを連結し、空白・改行を除去してデコードした後、SHA-256を検証します。

## 復元方法

PowerShell 7またはWindows PowerShellで、このフォルダ内から実行してください。

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\Restore-SourceArchive.ps1
```

成功すると次のファイルが生成されます。

```text
foobar2000_to_Synology_Playlist_Converter_v1.1.5_source.zip
```

展開:

```powershell
Expand-Archive `
  -LiteralPath .\foobar2000_to_Synology_Playlist_Converter_v1.1.5_source.zip `
  -DestinationPath .\src
```

## ソースZIP

| 項目 | 値 |
|---|---|
| SHA-256 | `804ad909f1bce195db7a58eb039cb4e04e697fab64b90997095788f652b88a1f` |
| 内容 | v1.1.5 C#ソース、SLN、CSPROJ、アイコン、self-test資産、公開文書 |
| 除外 | `bin`、`obj`、`publish`、EXE、DLL、PDB、ログ、CSV、一時ファイル、内部作業指示 |

## 対応する配布EXE

| 項目 | 値 |
|---|---|
| ファイル名 | `foobar2000_to_Synology_Playlist_Converter_v1.1.5.exe` |
| サイズ | `161,791,256 bytes` |
| SHA-256 | `D11F847B9CAEFA27CA34E1D6682D2B7CFB1EEC3B47A6CDDDF477A3A91F4D9FCE` |

## ビルド

Windows 10/11 x64と.NET 8 SDKが必要です。

```powershell
dotnet restore .\foobar2000_to_Synology_Playlist_Converter.sln
dotnet build .\foobar2000_to_Synology_Playlist_Converter.sln -c Release
dotnet publish .\foobar2000_to_Synology_Playlist_Converter.csproj `
  -c Release -r win-x64 --self-contained true `
  -p:PublishSingleFile=true -p:DebugType=None -p:DebugSymbols=false
```

発行EXEの検証:

```powershell
.\foobar2000_to_Synology_Playlist_Converter_v1.1.5.exe --self-test
```

成功条件は終了コード`0`および`SELF_TEST_OK`です。

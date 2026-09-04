# Security Policy

## Supported Version

| Version | Supported |
|---|---|
| v1.1.8 | Yes |
| v1.1.7 and older | No |

## Reporting a Vulnerability

セキュリティ上の問題を報告する場合、公開Issueへ資格情報、非公開パス、NASアドレス、個人ライブラリ情報、悪用可能な秘密情報を投稿しないでください。

## Release Verification

ダウンロードしたEXEはSHA-256を確認してください。

```powershell
Get-FileHash -Algorithm SHA256 .\foobar2000_to_Synology_Playlist_Converter_v1.1.8.exe
```

Expected SHA-256:

```text
553D7C2FAF1C31EF2D74F387BFB413762D507FFA40ADDBB37DCE2328E879E681
```

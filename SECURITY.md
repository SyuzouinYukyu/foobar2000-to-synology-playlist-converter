# Security Policy

## Supported Version

| Version | Supported |
|---|---|
| v1.1.2 | Yes |

## Reporting a Vulnerability

Please open a GitHub Issue with the `security` label, or contact the maintainer privately if the vulnerability includes sensitive details.

Do not publish exploit steps, private paths, credentials, NAS addresses, or personal library information in a public Issue.

## Release Verification

Verify the downloaded EXE with SHA-256 before running it.

```powershell
Get-FileHash -Algorithm SHA256 .\foobar2000_to_Synology_Playlist_Converter_v1.1.2.exe
```

Expected SHA-256:

```text
382ad84f1ce70c9d36af9bd37e37c08e0bf4390901b87dcf3c5d7245fdaf16d4
```

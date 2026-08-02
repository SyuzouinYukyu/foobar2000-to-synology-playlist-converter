$ErrorActionPreference = 'Stop'

$BaseDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$Parts = @(
    Get-ChildItem -LiteralPath $BaseDirectory -File -Filter 'source.zip.b64.part*' |
        Sort-Object Name
)

if ($Parts.Count -ne 11) {
    throw "Expected 11 source archive parts, but found $($Parts.Count)."
}

$Base64 = ($Parts | ForEach-Object {
    Get-Content -LiteralPath $_.FullName -Raw
}) -join ''

# GitHub may display or preserve line breaks/spaces in text parts. Base64 ignores none
# automatically here, so strip every whitespace character before decoding.
$Base64 = $Base64 -replace '\s', ''
$Bytes = [Convert]::FromBase64String($Base64)

$OutputPath = Join-Path $BaseDirectory 'foobar2000_to_Synology_Playlist_Converter_v1.1.5_source.zip'
[IO.File]::WriteAllBytes($OutputPath, $Bytes)

$ExpectedHash = '804ad909f1bce195db7a58eb039cb4e04e697fab64b90997095788f652b88a1f'
$ActualHash = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash.ToLowerInvariant()

if ($ActualHash -ne $ExpectedHash) {
    Remove-Item -LiteralPath $OutputPath -Force -ErrorAction SilentlyContinue
    throw "SHA-256 mismatch. Expected $ExpectedHash but got $ActualHash."
}

Write-Host "Created : $OutputPath"
Write-Host "SHA-256: $ActualHash"

$ErrorActionPreference = 'Stop'

$BaseDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$Parts = @(Get-ChildItem -LiteralPath $BaseDirectory -File -Filter 'source.zip.b64.part*' | Sort-Object Name)

if ($Parts.Count -ne 12) {
    throw "公開ソース分割ファイルは12個必要ですが、$($Parts.Count)個しか見つかりません。"
}

$Base64 = ($Parts | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join ''
$Base64 = $Base64 -replace '\s', ''
$Bytes = [Convert]::FromBase64String($Base64)

$OutputPath = Join-Path $BaseDirectory 'foobar2000_to_Synology_Playlist_Converter_v1.1.8_source.zip'
[IO.File]::WriteAllBytes($OutputPath, $Bytes)

$ExpectedHash = '77507A8BC6E697A089E08B751AF162A2170DBEE8A35454CF759E963A82FC0D7D'
$ActualHash = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash.ToUpperInvariant()
if ($ActualHash -ne $ExpectedHash) {
    Remove-Item -LiteralPath $OutputPath -Force -ErrorAction SilentlyContinue
    throw "SHA-256が一致しません。Expected=$ExpectedHash Actual=$ActualHash"
}

Write-Host "作成: $OutputPath"
Write-Host "SHA-256: $ActualHash"

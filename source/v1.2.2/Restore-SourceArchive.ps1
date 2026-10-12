$ErrorActionPreference = 'Stop'

$BaseDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$ExpectedPartNames = 0..13 | ForEach-Object { 'source.zip.b64.part{0:d3}' -f $_ }

$Parts = foreach ($Name in $ExpectedPartNames) {
    $Path = Join-Path $BaseDirectory $Name
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "公開ソース分割ファイルが不足しています: $Name"
    }
    Get-Item -LiteralPath $Path
}

$UnexpectedParts = @(Get-ChildItem -LiteralPath $BaseDirectory -File -Filter 'source.zip.b64.part*' |
    Where-Object { $_.Name -notin $ExpectedPartNames })
if ($UnexpectedParts.Count -gt 0) {
    throw "想定外の公開ソース分割ファイルがあります: $($UnexpectedParts.Name -join ', ')"
}

$Base64 = ($Parts | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join ''
$Base64 = $Base64 -replace '\s', ''
$Bytes = [Convert]::FromBase64String($Base64)
$OutputPath = Join-Path $BaseDirectory 'foobar2000_to_Synology_Playlist_Converter_v1.2.2_source.zip'
[IO.File]::WriteAllBytes($OutputPath, $Bytes)

$ExpectedHash = 'CE99702B3E166D62C7176657438972869629B0AB234C71AD3CBFE75C4270626A'
$ActualHash = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash.ToUpperInvariant()
if ($ActualHash -ne $ExpectedHash) {
    Remove-Item -LiteralPath $OutputPath -Force -ErrorAction SilentlyContinue
    throw "SHA-256が一致しません。Expected=$ExpectedHash Actual=$ActualHash"
}

Write-Host "作成: $OutputPath"
Write-Host "SHA-256: $ActualHash"

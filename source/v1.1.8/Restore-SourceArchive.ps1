$ErrorActionPreference = 'Stop'

$BaseDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$ExpectedPartNames = @(
    'source.zip.b64.part00',
    'source.zip.b64.part01',
    'source.zip.b64.part02',
    'source.zip.b64.part03',
    'source.zip.b64.part04a',
    'source.zip.b64.part04b',
    'source.zip.b64.part05a',
    'source.zip.b64.part05b',
    'source.zip.b64.part06',
    'source.zip.b64.part07a',
    'source.zip.b64.part07b',
    'source.zip.b64.part08a',
    'source.zip.b64.part08b',
    'source.zip.b64.part09'
)

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

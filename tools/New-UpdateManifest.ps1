[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Executable,
    [string]$Repository='Found-L/xiangfeng-updates',
    [string]$OutputDirectory=(Join-Path (Get-Location).Path '.artifacts')
)
$ErrorActionPreference='Stop'
if($Repository -notmatch '^[A-Za-z0-9-]+/[A-Za-z0-9_.-]+$'){throw 'GitHub 仓库格式无效'}
$taskExe=[IO.Path]::GetFullPath($Executable)
$taskInfo=[Diagnostics.FileVersionInfo]::GetVersionInfo($taskExe)
if($taskInfo.ProductName -ne '相逢' -or $taskInfo.FileVersion -notmatch '^(\d+\.\d+\.\d+)\.0$'){throw '不是相逢正式版本程序'}
$taskVersion=$Matches[1]
$taskAssetName='相逢-v'+$taskVersion+'.exe'
$taskManifest=[ordered]@{schema=1;app='PixelSword';version=$taskVersion;platform='win-x64';runtimeMajor=8;downloadUrl=('https://github.com/'+$Repository+'/releases/download/v'+$taskVersion+'/'+[Uri]::EscapeDataString($taskAssetName));sha256=(Get-FileHash -LiteralPath $taskExe -Algorithm SHA256).Hash;bytes=(Get-Item -LiteralPath $taskExe).Length;notes='新版相逢：保留个人配置与取色。'}
New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
Copy-Item -LiteralPath $taskExe -Destination (Join-Path $OutputDirectory $taskAssetName) -Force
# Keep the existing fixed download link usable for older messages and bookmarks.
Copy-Item -LiteralPath $taskExe -Destination (Join-Path $OutputDirectory 'xiangfeng.exe') -Force
$taskManifest | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $OutputDirectory 'update.json') -Encoding utf8
Write-Output ('生成 '+$taskAssetName+'、兼容固定链接的 xiangfeng.exe 和 update.json；发布前请完成客户端构建与更新验证。')

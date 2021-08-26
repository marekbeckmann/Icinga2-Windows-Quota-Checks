<#
.DESCRIPTION
   The script checks disk quotas on windows server
.EXAMPLE
   $PATH/check-diskquota.ps1 -path <path> -threshold <threshold in per-cent>
   $PATH/check-diskquota.ps1 --path "C:\Temp" -threshold 90
 .NOTES
   If no path is specified, script will skip and exit. If no Threshold is specified, the default value 80% applies.
#>

[CmdletBinding(DefaultParameterSetName = 'args')]
param (
    [Parameter()][string]$path,
    [Parameter()][double]$threshold
)
$SCRIPT_NAME = $MyInvocation.MyCommand.Name

function help() {
    Write-Output "Script to check disk quotas on Windows Server
Usage: $SCRIPT_NAME -path <path> -threshold <threshold>
    
-p                                      Any path, if it includes special characters, double quote it
-t                                      Warning threshold in % (Default: 80)"
}

function get-quota() {
    $quota = Get-FsrmQuota -Path $path
    $quotaSize = $quota.Size
    $quotaUsage = $quota.Usage
    if ($quotaUsage -gt ($quotaSize * ($threshold / 100)) -and ($null -ne $path)) {
        return "Quota used over $threshold %"
        exit 0
    }
    else {
        help
        exit 0
    }

}
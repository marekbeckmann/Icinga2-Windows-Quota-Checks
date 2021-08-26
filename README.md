# Icinga2 Windows QuotaChecks

Check Quotas on Windows (Server)

## 1. How to use

Basic Syntax: 
```
$PATH/check-diskquota.ps1 -path <path> -threshold <threshold in per-cent>
```
Your path has to be an existing path, that has a Quota set to it. If you don't specify a path, the check exits.
As Threshold, you can set any number between 0 and 100%. The default value is set to 80%


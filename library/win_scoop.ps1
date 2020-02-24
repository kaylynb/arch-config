#!powershell

#Requires -Module Ansible.ModuleUtils.ArgvParser
#Requires -Module Ansible.ModuleUtils.CommandUtil
#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
  options = @{
    name = @{ type = "list"; elements = "str"; required = $true }
    state = @{ type = "str"; default = "present"; choices = "present","absent" }
  }
}

$module = [Ansible.Basic.AnsibleModule]::Create($args,$spec)

$name = $module.Params.name
$state = $module.Params.state

function Install-Scoop {

  $scoop_app = Get-Command -Name scoop.ps1 -Type ExternalScript -ErrorAction SilentlyContinue

  if ($module.CheckMode -and $null -eq $scoop_app) {
    $module.Result.skipped = $true
    $module.Result.msg = "Skipped check mode run on win_scoop as scoop.ps1 cannot be found on the system"
    $module.ExitJson()
  }

  if (-not (Test-Path -Path $scoop_app.Path)) {
    $module.FailJson("Failed to find scoop.ps1, make sure it is added to the PATH")
  }

  return $scoop_app.Path
}

function Get-ScoopPackages {
  param(
    [Parameter(Mandatory = $true)] [string]$scoop_path
  )

  $command = Argv-ToString -arguments @("powershell.exe",$scoop_path,"export")
  $res = Run-Command -Command $command
  if ($res.rc -ne 0) {
    $module.Result.command = $command
    $module.Result.rc = $res.rc
    $module.Result.stdout = $res.stdout
    $module.Result.stderr = $res.stderr
    $module.FailJson("Error checking installed packages")
  }

  $installed_packages = $res.stdout -split "`n" |
  Select-String '(.*?) \(v:(.*?)\) \[(.*?)\]' |
  ForEach-Object {
    New-Object PSObject -Property ([Ordered]@{
        "Package" = $_.Matches[0].Groups[1].Value
        "Version" = $_.Matches[0].Groups[2].Value
        "Bucket" = $_.Matches[0].Groups[3].Value
      })
  }

  return $installed_packages
}
function Install-ScoopPackage {
  param(
    [Parameter(Mandatory = $true)] [string]$scoop_path,
    [Parameter(Mandatory = $true)] [String[]]$packages
  )
  $arguments = [System.Collections.ArrayList]@("powershell.exe",$scoop_path,"install")
  $arguments.AddRange($packages)

  $command = Argv-ToString -arguments $arguments
  $res = Run-Command -Command $command
  $module.Result.rc = $res.rc

  if ($module.Verbosity -gt 1) {
    $module.Result.stdout = $res.stdout
  }
  $module.Result.changed = $true
}

$scoop_path = Install-Scoop

$installed_packages = Get-ScoopPackages -scoop_path $scoop_path

if ($state -in @("present")) {
  $missing_packages = [System.Collections.ArrayList]@()
  foreach ($package in $name) {
    if ($installed_packages.Package -notcontains $package) {
      $missing_packages.Add($package)
    }
  }

  if ($missing_packages) {
    Install-ScoopPackage -scoop_path $scoop_path -packages $missing_packages
  }
}

$module.ExitJson()

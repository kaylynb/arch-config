#!powershell

#Requires -Module Ansible.ModuleUtils.ArgvParser
#Requires -Module Ansible.ModuleUtils.CommandUtil
#AnsibleRequires -CSharpUtil Ansible.Basic

$spec = @{
  options = @{
    name  = @{ type = "list"; elements = "str"; required = $true }
    state = @{ type = "str"; default = "present"; choices = "present", "absent" }
  }
}

$module = [Ansible.Basic.AnsibleModule]::Create($args, $spec)

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

function Get-ScoopBuckets {
  param(
    [Parameter(Mandatory = $true)] [string]$scoop_path
  )

  $command = Argv-ToString -arguments @("powershell.exe", $scoop_path, "bucket", "list")
  $res = Run-Command -Command $command
  if ($res.rc -ne 0) {
    $module.Result.command = $command
    $module.Result.rc = $res.rc
    $module.Result.stdout = $res.stdout
    $module.Result.stderr = $res.stderr
    $module.FailJson("Error checking installed buckets")
  }

  return $res.stdout -split "`r`n"
}
function Install-ScoopBucket {
  param(
    [Parameter(Mandatory = $true)] [string]$scoop_path,
    [Parameter(Mandatory = $true)] [String]$bucket
  )
  $arguments = [System.Collections.ArrayList]@("powershell.exe", $scoop_path, "bucket", "add")
  $arguments.Add($bucket)

  $command = Argv-ToString -arguments $arguments
  $res = Run-Command -Command $command
  $module.Result.rc = $res.rc

  if ($module.Verbosity -gt 1) {
    $module.Result.stdout = $res.stdout
  }
  $module.Result.changed = $true
}

$scoop_path = Install-Scoop

$installed_buckets = Get-ScoopBuckets -scoop_path $scoop_path

if ($state -in @("present")) {
  $missing_buckets = [System.Collections.ArrayList]@()
  foreach ($bucket in $name) {
    if ($installed_buckets -notcontains $bucket) {
      $missing_buckets.Add($bucket)
    }
  }

  if ($missing_buckets) {
    foreach ($missing_bucket in $missing_buckets) {
      Install-ScoopBucket -scoop_path $scoop_path -bucket $missing_bucket
    }
  }
}

$module.ExitJson()

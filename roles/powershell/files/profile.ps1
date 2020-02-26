Set-PSReadLineOption -EditMode Emacs -BellStyle None

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'
Import-Module PSFzf

function prompt {
	function IsAdmin() {
		$WindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal(
			[System.Security.Principal.WindowsIdentity]::GetCurrent()
		)

		$WindowsPrincipal.IsInRole(
			[System.Security.Principal.WindowsBuiltInRole]::Administrator
		)
	}

	$Admin = ""
	if (IsAdmin) {
		$Admin = "(admin) "
	}

	$Host.UI.RawUI.WindowTitle = "$Admin$env:USERNAME@$($env:COMPUTERNAME):$PWD"

	$ExitCodeDisplay = ""
	if ($LASTEXITCODE) {
		$ExitCodeDisplay = "`e[38;5;1m$LASTEXITCODE`e[0m "
	}

	"`e[38;5;3m$((Get-Date).ToLongTimeString())`e[0m `e[38;5;1m$Admin`e[0m`e[38;5;6m[$env:USERNAME@$env:COMPUTERNAME]`e[0m `e[38;5;5m$PWD`e[0m`r`n$($ExitCodeDisplay)> "
}

# Load all ps1 files in profile.d directory
Get-ChildItem (Join-Path $PSScriptRoot profile.d) | ? { $_.Name -like '*.ps1' } | Sort-Object | % { . $_.FullName }

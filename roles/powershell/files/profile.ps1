Set-PSReadLineOption -EditMode Emacs -BellStyle None

Remove-PSReadlineKeyHandler 'Ctrl+r'
Remove-PSReadlineKeyHandler 'Ctrl+t'
Import-Module PSFzf

function prompt {
	$Host.UI.RawUI.WindowTitle = "$env:USERNAME@$($env:COMPUTERNAME):$PWD"

	$ExitCodeDisplay = ""
	if ($LASTEXITCODE) {
		$ExitCodeDisplay = "$LASTEXITCODE "
	}

	"`e[38;5;3m$((Get-Date).ToLongTimeString())`e[0m `e[38;5;6m[$env:USERNAME@$env:COMPUTERNAME]`e[0m `e[38;5;5m$PWD`e[0m`r`n`e[38;5;1m$($ExitCodeDisplay)`e[0m> "
}

$ResourceGroup = 'Modul-04-TB'
$ResourceDirectory = 'C:\IAC-TISIP-2022'

New-AzResourceGroup -Name $ResourceGroup -Location 'West Europe' -Force
New-AzResourceGroupDeployment `
    -Name 'Modul-04-Storage-TB' `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-03.json" `
    -StorageName 'tbtest01'

Write-Host -ForegroundColor Cyan 'Resource Created. Verify resource...'
[String]$UserInput = Read-host -Prompt 'Enter anything and press enter when you want to remove resource'

if ($UserInput -eq $true -or $UserInput -notlike $false) {
    Remove-AzResourceGroup -Name $ResourceGroup -Force
}
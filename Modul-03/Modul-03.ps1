$TenantID = '02feabb9-444e-4f66-9c13-6a8f04b75c2f'
$SubscriptionID = 'efc1e7b1-5729-4eea-b33e-12cc6b1c0183'

if ($Credentials -eq $null) {
    $Credentials = Get-Credential
}

Connect-AzAccount -ServicePrincipal -Credential $Credentials -TenantID $TenantID -Subscription $SubscriptionID

$ResourceGroup = 'Modul-03-TB'
$ResourceDirectory = 'C:\IAC-TISIP-2022'

New-AzResourceGroup -Name $ResourceGroup -Location 'West Europe' -Force
New-AzResourceGroupDeployment `
    -Name 'Modul-03-Storage-TB' `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-03.json" `
    -StorageName 'tbtest01'

Write-Host -ForegroundColor Cyan 'Resource Created. Verify resource...'
[String]$UserInput = Read-host -Prompt 'Enter anything and press enter when you want to remove resource'

if ($UserInput -eq $true -or $UserInput -notlike $false) {
    Remove-AzResourceGroup -Name $ResourceGroup -Force
}
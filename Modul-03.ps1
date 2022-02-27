$TenantID = '02feabb9-444e-4f66-9c13-6a8f04b75c2f'
$SubscriptionID = 'efc1e7b1-5729-4eea-b33e-12cc6b1c0183'
$Credentials = Get-Credential

Connect-AzAccount -ServicePrincipal -Credential $Credentials -TenantID $TenantID -Subscription $SubscriptionID

$ResourceGroup = 'Modul-03'

New-AzResourceGroup -Name $ResourceGroup -Location 'West-Europe' -Force
New-AzResourceGroupDeployment `
    -Name 'Modul-03-Storage' `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile '.\Modul-03.json'
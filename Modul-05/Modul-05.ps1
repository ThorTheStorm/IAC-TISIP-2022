#Variables
$ResourceGroup = 'Modul-05-TB'
$ResourceDirectory = 'C:\IAC-TISIP-2022\Modul-04'
$UserInput = $null

$Account01 = 'M05TB-DEV'
$Account02 = 'M05TB-PROD'



#Create Azure resource group
New-AzResourceGroup `
    -Name $ResourceGroup `
    -Location 'West Europe' `
    -Force

#Create group deployment
New-AzResourceGroupDeployment `
    -Name 'M-05-TB' `
    -AccountName $Account01 `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-05.json" `

New-AzResourceGroupDeployment `
    -Name 'M-05-TB' `
    -AccountName $Account02 `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-05.json" `

#Gets user-input y/n for deletion of resource
Write-Host -ForegroundColor Cyan 'Resource Created. Verify resource before continuing...'
[String]$UserInput = Read-host -Prompt 'Enter anything and press enter when you want to remove resource'

if ($UserInput -eq 'y' -or 'yes') {
    Remove-AzResourceGroup -Name $RG -Force -Verbose
}
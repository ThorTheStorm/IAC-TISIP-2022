#Variables
$ResourceGroup = 'Modul-05-TB'
$ResourceDirectory = 'C:\IAC-TISIP-2022\Modul-05'
$UserInput = $null

#Create Azure resource group
New-AzResourceGroup `
    -Name $ResourceGroup `
    -Location 'West Europe' `
    -Force

#Create group deployment
New-AzResourceGroupDeployment `
    -Name 'M-05-TB-DEV' `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-05.json" `
    -TemplateParameterFile "$ResourceDirectory\Modul-05-dev.parameters.json" 

New-AzResourceGroupDeployment `
    -Name 'M-05-TB-PROD' `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-05.json" `
    -TemplateParameterFile "$ResourceDirectory\Modul-05-prod.parameters.json" 

#Gets user-input y/n for deletion of resource
Write-Host -ForegroundColor Cyan 'Resource Created. Verify resource before continuing...'
[String]$UserInput = Read-host -Prompt 'Enter anything and press enter when you want to remove resource'

if ($UserInput -eq 'y' -or 'yes') {
    Remove-AzResourceGroup -Name $ResourceGroup -Force -Verbose
}
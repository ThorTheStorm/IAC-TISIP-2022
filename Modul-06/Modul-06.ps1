#Variables
$ResourceGroup = 'Modul-06-TB'
$ResourceDirectory = 'C:\IAC-TISIP-2022\Modul-06'
$UserInput = $null

#Create Azure resource group
New-AzResourceGroup `
    -Name $ResourceGroup `
    -Location 'West Europe' `
    -Force

#Create group deployment
New-AzResourceGroupDeployment `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-06.json" `
    -TemplateParameterFile "$ResourceDirectory\Modul-06-DEV.parameters.json" 

#Production
New-AzResourceGroupDeployment `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-06.json" `
    -TemplateParameterFile "$ResourceDirectory\Modul-06-PROD.parameters.json" 

#Gets user-input y/n for deletion of resource
Write-Host -ForegroundColor Cyan 'Resource Created. Verify resource before continuing...'
[String]$UserInput = Read-host -Prompt 'Enter anything and press enter when you want to remove resource'

if ($UserInput -eq 'y' -or 'yes') {
    Remove-AzResourceGroup -Name $ResourceGroup -Force -Verbose
}
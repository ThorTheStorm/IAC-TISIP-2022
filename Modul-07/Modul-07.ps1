#Variables
$ResourceGroup = 'Modul-07-TB-TEST'
$ResourceDirectory = 'C:\IAC-TISIP-2022\Modul-07'
$UserInput = $null

#Create Azure resource group
New-AzResourceGroup `
    -Name $ResourceGroup `
    -Location 'West Europe' `
    -Force

#Create group deployment
New-AzResourceGroupDeployment `
    -ResourceGroupName $ResourceGroup `
    -TemplateFile "$ResourceDirectory\Modul-07.json" `
    -TemplateParameterFile "$ResourceDirectory\Modul-07-DEV.parameters.json" 

#Gets user-input y/n for deletion of resource
Write-Host -ForegroundColor Cyan 'Resource Created. Verify resource before continuing...'
[String]$UserInput = Read-host -Prompt 'Enter anything and press enter when you want to remove resource'

if ($UserInput -eq 'y' -or 'yes') {
    Remove-AzResourceGroup -Name $ResourceGroup -Force -Verbose
}
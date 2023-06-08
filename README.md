# Microsoft_Bicep

You can view the JSON template that's submitted to Resource Manager by using the bicep build command
bicep build main.bicep

$PSVersionTable
bicep --version

Install-Module -Name Az -Repository PSGallery -Force
connect-azaccount

$context = Get-AzSubscription -SubscriptionId {Your subscription ID}
Set-AzContext $context

Set-AzDefault -ResourceGroupName [sandbox resource group name]
Set-Location -Path C:\temp\Microsoft_Bicep\bicep_fundamental\first_bicep_template


New-AzResourceGroupDeployment -TemplateFile main.bicep

Azure CLI deployment with Bicep:
az deployment group create \
  --template-file main.bicep \
  --resource-group storage-resource-group

Deployment commands:
New-AzResourceGroupDeployment -TemplateFile .\1_vanila_main.bicep
New-AzResourceGroupDeployment -TemplateFile .\2_parameters_main.bicep -environmentType nonprod
New-AzResourceGroupDeployment -TemplateFile .\3_module_main.bicep -environmentType nonprod
New-AzResourceGroupDeployment -TemplateFile .\4_description_main.bicep
New-AzResourceGroupDeployment -TemplateFile .\5_parameterfile_main.bicep -TemplateParameterFile .\5_parameterfile_parameter.json
New-AzResourceGroupDeployment -TemplateFile .\6_conditions_main.bicep -location westeurope
New-AzResourceGroupDeployment -TemplateFile .\7_loops_main.bicep

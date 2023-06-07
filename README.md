# Microsoft_Bicep

You can view the JSON template that's submitted to Resource Manager by using the bicep build command
bicep build main.bicep


Install-Module -Name Az -Repository PSGallery -Force
connect-azaccount

$context = Get-AzSubscription -SubscriptionId {Your subscription ID}
Set-AzContext $context

Set-AzDefault -ResourceGroupName [sandbox resource group name]


New-AzResourceGroupDeployment -TemplateFile main.bicep

Azure CLI deployment with Bicep:
az deployment group create \
  --template-file main.bicep \
  --resource-group storage-resource-group

68aa0317-df02-493d-b9c7-0fa97a84fde6
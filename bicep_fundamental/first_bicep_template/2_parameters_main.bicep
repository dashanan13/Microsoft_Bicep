//parameters
param location string = 'westeurope' 
param storageAccountName string = 'sa68aa0317${uniqueString(resourceGroup().id)}' //expression
param appServiceAppName string = 'app68aa0317${uniqueString(resourceGroup().id)}'

@allowed([
  'nonprod'
  'prod'
])
param environmentType string

//variables
var appServicePlanName = 'plandf02'
var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'  //conditional statements
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3' : 'F1'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

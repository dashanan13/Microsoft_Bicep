@description('Specifies the location for resources.')
param location string = 'westeurope'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'storage0fa97'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

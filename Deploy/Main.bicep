// Parameters

param location string = resourceGroup().location

param tags object

param vnetName string

param addressPrefixes array

param ipSubnets array

param bastionPubIpName string

param bastionName string

// Run

module vnet './modules/vnet/vnet.bicep' = {
  name: 'vnetDeploy'
  params:{
    location: location
    tags: tags
    vnetName: vnetName
    addressPrefixes: addressPrefixes
    ipSubnets: ipSubnets
  }
}

module bastion './modules/bastion/bastionhost.bicep' = {
  name: 'bastionDeploy'
  params: {
    bastionPubIpName: bastionPubIpName
    bastionName: bastionName
    location: location
    tags: tags
    vnetId: vnet.outputs.vnetId
  }
}

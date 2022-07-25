# Actualizar el Id de la suscripcion que se usara para el ejercicioo
$suscriptionId = "xxxx-xxxxx-xxxx-xxxxx"

# Se sugiere usar el numero de cedula para generar nombres de recursos que no se repitan en otras suscripciones
$cedula = "123456789"

#Valores que se sugiere no modificar
$location = "eastus"
$rgName = "az-rg-taller-contenedores-"+$cedula
$vmName = "az-vm-docker-01-"+$cedula
$vmSize = "Standard_B2s"
$vmImageID = "/subscriptions/dac6ba8b-38c4-402a-a481-986cebdc85e7/resourceGroups/az-rg-packer-taller-contenedores/providers/Microsoft.Compute/galleries/azvmsgallerytalleres/images/Ubuntu_18"


# Selecciona la suscripcion donde se va a trabajar
az account set -s $suscriptionId


# Crea el grupo de recursos donde se trabajara
az group create -l $location -n $rgName


az vm create -n $vmName -g $rgName `
--image $vmImageID `
--size $vmSize  `
--license-type "None" `
--location $location `
--public-ip-address-allocation "static" `
--public-ip-sku "Basic" `
--authentication-type "password" `
--specialized `
--accept-term `
--admin-password "Ubuntu1234567" `
--admin-username "ubuntu"

az vm open-port --resource-group $rgName --name $vmName --port 80 --priority 100
az vm open-port --resource-group $rgName --name $vmName --port 8080 --priority 180
az vm open-port --resource-group $rgName --name $vmName --port 8081 --priority 181
az vm open-port --resource-group $rgName --name $vmName --port 8082 --priority 182
az vm open-port --resource-group $rgName --name $vmName --port 8083 --priority 183

az vm show -d -g $rgName -n $vmName --query publicIps -o tsv
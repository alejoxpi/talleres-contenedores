# Actualizar el Id de la suscripcion que se usara para el ejercicioo
$suscriptionId = "xxxx-xxxxx-xxxx-xxxxx"

# Se sugiere usar el numero de cedula para generar nombres de recursos que no se repitan en otras suscripciones
$cedula = "123456789"

#Valores que se sugiere no modificar
$rgName = "az-rg-taller-contenedores-"+$cedula


# Selecciona la suscripcion donde se va a trabajar
az account set -s $suscriptionId

# Elimina el grupo de recursos donde se trabajara
az group delete -n $rgName --force-deletion-types "Microsoft.Compute/virtualMachines" --yes --no-wait

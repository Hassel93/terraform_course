ressourceGroupExist=$(az group exists --name "rg_test");

if [ "$ressourceGroupExist" == 'false' ]; then
  az group create --name "test_rg" --location "switzerlandnorth";
else
  echo "RG exists!"
fi
                
if az storage account show --name "storageaccountname" --resource-group "rg_test" --query "name"; then
  containerExist=$(az storage container exists --account-name "storageaccountname" --name "container" --query "exists" --auth-mode login);
else
  storageAccountNotExist='true'
  containerExist='false'; 
fi

if [ "$storageAccountNotExist" == 'true' ]; then
  az storage account create --name "storageaccountname" --resource-group "rg_test" --kind StorageV2 --location "switzerlandnorth" --sku Standard_LRS
else
  echo "ST exists!"
fi

if [ "$containerExist" == 'false' ]; then
  az storage container create --name "container" --account-name "storageaccountname"
else
  echo "Container exists!"
fi
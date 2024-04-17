
# Linked Template deployment on Sub. Level Command
 New-AzTemplateSpec -Name mainspec -Version "1.0.0.0" -ResourceGroupName rg-test-purview-integration -Location centralIndia -TemplateFile main.json
 $id = (Get-AzTemplateSpec -ResourceGroupName rg-test-purview-integration -Name mainspec -Version "1.0.0.0").Versions.Id
 New-AzSubscriptionDeployment -Location centralIndia -TemplateSpecId $id  -TemplateParameterFile parameter.json

 # Subscription level Deployment Command
 New-AzSubscriptionDeployment  -Name demoDeployment  -Location "eastus" -TemplateFile main.bicep  -TemplateParameterFile parameterFile.json 

#Resourece Group Deployment Command
New-AzResourceGroupDeployment -ResourceGroupName apoorv-rg -TemplateFile AccessIAMRoles.bicep -TemplateParameterFile parameterFile.json

 
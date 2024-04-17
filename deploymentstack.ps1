
# subscription level deployment 
New-AzSubscriptionDeploymentStack `
  -Name "webAppStack" `
  -Location "eastus" `
  -TemplateFile "Main_File\main.bicep" `
  -TemplateParameterFile "Main_File\parameterFile.json" `
  -DenySettingsMode "none"

 # subscription level deployment (if updated inside Bicep file)
Set-AzSubscriptionDeploymentStack `
  -Name "webAppStack" `
  -Location "eastus" `
  -TemplateFile "Main_File\main.bicep" `
  -TemplateParameterFile "Main_File\parameterFile.json" `
  -DenySettingsMode "none"

  # get managed resources 
  (Get-AzSubscriptionDeploymentStack -Name "webAppStack").Resources


  # remove deployment stack based upon the condition
  Remove-AzSubscriptionDeploymentStack `
  -Name "webAppStack" `
  -DeleteResourceGroups -DeleteResources


 


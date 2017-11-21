$MySubscribtion = "3c1acdbb-6c4a-4709-b589-1e6fe59ccd99"
$MyLocation = "West Europe"
$MyResourceGroup = "TaskOne"
$MyResourceGroupDeployment = "TaskOneDeployment"
$MyTemplationFile = "C:\Users\Andrii_Kopytsia\Documents\azure-scripts\task-1\template.json"

Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName $MySubscribtion


Get-AzureRmResourceGroup -Name $MyResourceGroup -ev notPresent -ea 0
if ($notPresent) {
    New-AzureRmResourceGroup -Name $MyResourceGroup -Location $MyLocation
} else {
    Write-Host "ResourceGroup already exist"
}


New-AzureRmResourceGroupDeployment -Name $MyResourceGroupDeployment -ResourceGroupName $MyResourceGroup  -TemplateFile $MyTemplationFile -storageAccountType Standard_LRS

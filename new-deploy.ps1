$MySubscribtion = "3c1acdbb-6c4a-4709-b589-1e6fe59ccd99"
$MyLocation = "West Europe"
$MyResourceGroup = "TaskOne"

Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName $MySubscribtion


Get-AzureRmResourceGroup -Name $MyResourceGroup -ev notPresent -ea 0
if ($notPresent) {
    New-AzureRmResourceGroup -Name $MyResourceGroup -Location $MyLocation
} else {
    Write-Host "ResourceGroup already exist"
}



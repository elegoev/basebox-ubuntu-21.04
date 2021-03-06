# create vagrant cloud box

# check vagrant cloud token for packer (PACKER_VAGRANTCLOUD_TOKEN)
if (-not (Test-Path env:PACKER_VAGRANTCLOUD_TOKEN)) { 
  Write-Host "Environment variable 'PACKER_VAGRANTCLOUD_TOKEN' not set" -ForegroundColor Red
} else {

  # set vagrant image name
  $IMAGE_NAME = $env:IMAGE_NAME

  # show used token
  # Write-Host "token = $env:PACKER_VAGRANTCLOUD_TOKEN"

  # check if login user
  vagrant cloud auth login --token $env:PACKER_VAGRANTCLOUD_TOKEN
  if($?) {
    
    # check cloud image
    # vagrant cloud search $IMAGE_NAME --short | Select-String -Pattern 'elegoev/ubuntu-21.04'
    Write-Host "image name = $IMAGE_NAME"
    vagrant cloud box create "elegoev/$IMAGE_NAME" --no-private

  } else {
    Write-Host "Wrong vagrant cloud token configured" -ForegroundColor Red
  }

}






# run packer for vagrant virtualbox provider
$env:SRC_IMAGE_NAME = 'ubuntu/hirsute64'
$env:SRC_IMAGE_VERSION = '20210720.0.1'

packer build packer-virtualbox.json 
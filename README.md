# wsl-distros

### HowTo from https://source.coveo.com/2019/10/18/wsl-from-dockerfile/
```sh
docker build --file $containerName.dockerfile --tag $imageTag   
docker run --name $containerName $imageTag  
docker export --output=$distroName.tar $containerName   
wsl.exe --import $distroName $installLocation $distroName.tar   
```

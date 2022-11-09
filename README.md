# wsl-distros

### HowTo from https://source.coveo.com/2019/10/18/wsl-from-dockerfile/
```sh
docker build --file $containerName.dockerfile --tag $imageTag   
docker run --name $containerName $imageTag  
docker export --output=$distroName.tar $containerName   
wsl.exe --import $distroName $installLocation $distroName.tar   
```

### First time use container
---
1. open with nvim '~/.config/nvim/lua/plug.lua'
2. Run ':PackerInstall'
3. open with nvim '~/.config/nvim/lua/opts.lua'
4. Uncomment '--cmd('colorscheme dracula')'
5. Restart nvim


# wsl-distros

### ubuntu-2204
Installed with:
* ZSH
* oh-my-zsh
* Theme xiong-chiamiov-plus
* Neovim
* Lua config files

**Plugins**
```lua
-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' }                       -- start screen
  use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme

 -- [[ Dev ]]
  use {
    'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'majutsushi/tagbar' }                        -- code structure
  use { 'Yggdroot/indentLine' }                      -- see indentation
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history
  use { 'windwp/nvim-autopairs' }                    -- auto close brackets, etc.
  use {'tpope/vim-commentary'}                       -- comment code
  use {'neovim/nvim-lspconfig'}                      -- Configurations for Nvim LSP

  -- install Mardown Preview without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
  })

end)

```
**Build Image**
```sh
export WSL_USER=username
export WSL_USER_PASS=userpassword

docker build --build-arg WSL_USER=$WSL_USER --build-arg  WSL_USER_PASS=$WSL_USER_PASS -t ubuntu22.04_dev:latest .

```

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


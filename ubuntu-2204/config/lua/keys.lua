--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
-- map('i', 'jk', '<ESC>', {})
--
-- Toggle nvim-tree
map('n', 'n', [[:NvimTreeToggle]], {})

-- Toggle more plugins
map('n', 'l', [[:IndentLinesToggle]], {})
map('n', 't', [[:TagbarToggle]], {})
map('n', 'ff', [[:Telescope find_files]], {})

-- Terminal in Window
map('n', 'w', [[:sp term://zsh]], {})
map('n', 'w6', [[:res -6]], {})

-- Markdown Preview
map('n', 'm', [[:MarkdownPreviewToggle]], {})

-- map <C-s> <Plug>MarkdownPreview
-- nmap <M-s> <Plug>MarkdownPreviewStop
-- nmap <C-p> <Plug>MarkdownPreviewToggle

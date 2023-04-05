local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local leader_char = '`'
vim.api.nvim_set_keymap('', leader_char, '<Nop>', opts)
vim.g.maplocalleader = leader_char
vim.g.mapleader = leader_char

-- faster scrolling/movement commands
keymap('n', '<S-h>', '10h', opts)
keymap('n', '<S-j>', '10j', opts)
keymap('n', '<S-k>', '10k', opts)
keymap('n', '<S-l>', '10l', opts)

-- faster scrolling/movement commands
keymap('n', '<S-A-h>', '5h', opts)
keymap('n', '<S-A-j>', '5j', opts)
keymap('n', '<S-A-k>', '5k', opts)
keymap('n', '<S-A-l>', '5l', opts)

-- easier split creation
keymap('n', '<leader>s', ':split<CR>', opts)
keymap('n', '<leader>v', ':vsplit<CR>', opts)

-- easier window navigation
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- easier window resizing
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts)

-- easier buffer navigation
keymap('n', '+', ':bnext<CR>', opts)
keymap('n', '_', ':bprevious<CR>', opts)

-- Visual Line --
-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)

-- Visual Block --
-- Move text up and down
keymap('v', "J", ":move '>+1<CR>gv-gv", opts)
keymap('v', "K", ":move '<-2<CR>gv-gv", opts)
keymap('v', "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap('v', "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Best mapping ever!
-- Dont store a replaced word from a visual selection in the yank register.
-- This allows you to copy text into the yank buffer and repeat paste it
-- without the text you replace itself replacing the text in the yank
-- register.
keymap('v', "p", '"_dP', opts)

-- toggle relative numbers
keymap('n', '<leader>rn', ':set relativenumber!<cr>', opts) 

-- Paste from clipboard
keymap('n', '<leader>p', '"+p', opts) 

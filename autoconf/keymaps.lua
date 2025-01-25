local opts = { noremap = true, silent = true }

-- copy and paste
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', opts)
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', opts)

-- enter normal mode in terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- explorer shortcut
vim.api.nvim_set_keymap("n", "<C-n>", ":Lex 15 %:p:h<CR>", opts)

-- window navigation in :Lex (netrw)
vim.cmd([[
  augroup NetrwMappings
    autocmd!
    autocmd FileType netrw nnoremap <buffer> <C-h> <C-w>h
    autocmd FileType netrw nnoremap <buffer> <C-j> <C-w>j
    autocmd FileType netrw nnoremap <buffer> <C-k> <C-w>k
    autocmd FileType netrw nnoremap <buffer> <C-l> <C-w>l
  augroup END
]])

-- split most recent split excluding :Lex
vim.cmd([[
  augroup NetrwSplitMappings
    autocmd!
    autocmd FileType netrw nnoremap <buffer> v :wincmd p <bar> vsplit <C-R>=expand('%:p:h') . '/' . expand('<cfile>')<CR><CR>
    autocmd FileType netrw nnoremap <buffer> o :wincmd p <bar> split <C-R>=expand('%:p:h') . '/' . expand('<cfile>')<CR><CR>
  augroup END
]])

-- window Resizing
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move text right and left
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- move text up and down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- hold on to pasted line
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- use space-bar both for opening and closing folds
vim.api.nvim_set_keymap('n', '<Space>', 'za', opts)


-- toggle spelling with CTRL+s
vim.api.nvim_set_keymap("n", "<C-s>", ":setlocal spell!<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:setlocal spell!<CR>a", opts)

-- Auto-close mappings (commented out in the original)
-- vim.api.nvim_set_keymap("i", "'", "''<Left>", opts)
-- vim.api.nvim_set_keymap("i", '"', '""<Left>', opts)
-- vim.api.nvim_set_keymap("i", "(", "()<Left>", opts)
-- vim.api.nvim_set_keymap("i", "[", "[]<Left>", opts)
-- vim.api.nvim_set_keymap("i", "{", "{}<Left>", opts)

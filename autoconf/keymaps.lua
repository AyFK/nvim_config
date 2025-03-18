
function map(mode, lhs, rhs)
    local options = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- copy and paste
map("n", "<C-v>", '"+p')
map("v", "<C-c>", '"+y')

-- enter normal mode in terminal
map("t", "<Esc>", "<C-\\><C-n>")

-- window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- explorer shortcut
vim.keymap.set("n", "<C-n>", function()
  vim.g.prev_win = vim.api.nvim_get_current_win()  -- remember current window ID
  vim.cmd("Lex 15 %:p:h")                          -- open netrw
end, { silent = true })

-- split most recent window ID
vim.cmd([[
  augroup NetrwSplitMappings
  autocmd!
  autocmd FileType netrw nnoremap <buffer> v :execute 'call win_gotoid(g:prev_win)'<bar> vsplit <C-R>=expand('%:p:h') . '/' . expand('<cfile>')<CR><CR>
  autocmd FileType netrw nnoremap <buffer> o :execute 'call win_gotoid(g:prev_win)'<bar> split <C-R>=expand('%:p:h') . '/' . expand('<cfile>')<CR><CR>
  augroup END
]])

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



-- window Resizing
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- move text right and left
map("v", "<", "<gv")
map("v", ">", ">gv")

-- move text up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- hold on to pasted line
map("v", "p", '"_dP')

-- use space-bar both for opening and closing folds
map('n', '<Space>', 'za')


-- toggle spelling with CTRL+s
map("n", "<C-s>", ":setlocal spell!<CR>")
map("i", "<C-s>", "<Esc>:setlocal spell!<CR>a")

-- scrolling remap
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- auto-close mappings (commented out in the original)
-- map("i", "'", "''<Left>")
-- map("i", '"', '""<Left>')
-- map("i", "(", "()<Left>")
-- map("i", "[", "[]<Left>")
-- map("i", "{", "{}<Left>")

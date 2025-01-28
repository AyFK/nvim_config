-- Command to set shell to bash.exe
vim.api.nvim_create_user_command('BASHexe', function()
  vim.o.shell = 'bash.exe'
end, {})

-- Python
-- Dependencies: None
-- PATH environmental variables(s): C:\Users\...\Python
vim.api.nvim_create_user_command('PR', function()
  vim.cmd('write')
  vim.cmd('vsplit | term python %')
end, {})

vim.api.nvim_create_user_command('Pr', function()
  vim.cmd('write')
  vim.cmd('vsplit | term python %')
end, {})

-- C++17
-- Dependencies: None
-- PATH environmental variables(s): C:\Users\...\CodeBlocks\MinGW\bin

-- Compile C++17
vim.api.nvim_create_user_command('CC', function()
  vim.cmd('write')
  vim.cmd('!c++ -std=c++17 % -o %:r')
end, {})

vim.api.nvim_create_user_command('Cc', function()
  vim.cmd('write')
  vim.cmd('!c++ -std=c++17 % -o %:r')
end, {})

-- Run C++17 code
vim.api.nvim_create_user_command('CR', function()
  vim.cmd('vsplit | term %:r')
end, {})

vim.api.nvim_create_user_command('Cr', function()
  vim.cmd('vsplit | term %:r')
end, {})


--vim.api.nvim_create_user_command('CC', function()
--  vim.cmd('write')
--  vim.cmd("execute 'lcd %:p:h' | vsplit | term bash -c \"c++ -std=c++17 % -o %:r && echo 'Compiled successfully. Run with: ./%:r' && exec bash\"")
--end, {})

-- Terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n><CR>]], { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>:', [[<C-\><C-n>:]], { noremap = true })

vim.api.nvim_set_keymap('n', 'T', [[:cd %:h | vsplit | term <CR>]], { noremap = true, silent = true })

-- CUDA
-- Dependencies: None
-- PATH environmental variables(s): C:\...\NVIDIA ... Toolkit\CUDA\vXX.X\bin
vim.api.nvim_create_user_command('GG', function()
  vim.cmd('write')
  vim.cmd('!nvcc % -o %:r')
end, {})

vim.api.nvim_create_user_command('Gg', function()
  vim.cmd('write')
  vim.cmd('!nvcc % -o %:r')
end, {})

vim.api.nvim_create_user_command('GR', function()
  vim.cmd('vsplit | term %:r')
end, {})

vim.api.nvim_create_user_command('Gr', function()
  vim.cmd('vsplit | term %:r')
end, {})

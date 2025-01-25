
-- add path to config folder
local config_path = vim.fn.stdpath("config")
vim.opt.runtimepath:append(config_path .. "/autoconf")

-- source files from config folder
dofile(config_path .. "/autoconf/settings.lua")
dofile(config_path .. "/autoconf/keymaps.lua")
dofile(config_path .. "/autoconf/rice.lua")
dofile(config_path .. "/autoconf/compilers.lua")
dofile(config_path .. "/autoconf/plugins.lua")
dofile(config_path .. "/autoconf/lsp.lua")

-- for when lua translation is difficult
vim.cmd("source " .. config_path .. "/autoconf/vimscripts.vim")



-- sets the fileformat to unix
vim.opt.fileformats = { "unix" }

-- unnecessary shadafile
vim.opt.shadafile = "NONE"

-- syntax highlight
vim.opt.syntax = "ON"

-- remove bell
vim.opt.belloff = "all"

-- show cursor line
vim.opt.cursorline = true

-- enable proper mouse scrolling
vim.opt.mouse = "a"

-- allow cursor to move one column beyond EOL
vim.opt.virtualedit = "onemore"

-- display line numbers
vim.opt.number = true

-- enable relative line numbers
vim.opt.relativenumber = true

-- open new splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- enable line wrapping
vim.opt.wrap = true

-- tab to 4 spaces and convert tabs to spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- scroll offsets
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- highlight search
vim.opt.hlsearch = true

-- ignore case in search patterns
vim.opt.ignorecase = true

-- show folds in column
vim.opt.foldcolumn = "1"

-- always show the tabline
vim.opt.showtabline = 2

-- set encoding
vim.opt.encoding = "utf-8"

-- spelling settings
vim.opt.spell = false
vim.opt.spelllang = {"en_us", "sv_se"}


vim.opt.list = true
vim.opt.listchars = {
    trail = "█", -- display trailing spaces
}


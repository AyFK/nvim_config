
-- colorscheme
vim.opt.termguicolors = true
--vim.cmd("colorscheme darkplus") -- buggy in .lua files for some odd reason

-- transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")

-- column fold color
vim.defer_fn(function()       -- defer custom highlight, apply after colorscheme
  vim.cmd("highlight FoldColumn guifg=#60707C")
end, 50)





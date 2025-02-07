
function _G.getModeName()
  local m = vim.fn.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    R = "REPLACE",
    v = "VISUAL",
    V = "VISUAL",
    [""] = "VISUAL",
    c = "COMMAND",
    s = "SELECT",
    S = "SELECT",
    t = "TERMINAL",
  }
  return modes[m] or m
end


vim.defer_fn(function()       -- defer custom highlight, apply after colorscheme
  vim.cmd("highlight StatusModifiedColor guifg=#F91C49 guibg=#1C1C1C")
end, 50)


function _G.getFileName()
  local fname = vim.fn.expand("%:t")
  if vim.bo.modified then
    -- when moified, wrap the filename in color
    return "%#StatusModifiedColor#" .. fname .. "%*"
  else
    return fname
  end
end


function _G.modifiedSymbol()
  if vim.bo.modified then
    return "*"
  else
    return " "
  end
end


vim.o.statusline =
    " %{%v:lua.getModeName()%} " ..     -- mode
    " %{%v:lua.getFileName()%}" ..      -- filename
    "%{%v:lua.modifiedSymbol()%} " ..   -- the modified symbol
    " %l,%c " ..                        -- row, column
    " %p%% "                            -- % of file

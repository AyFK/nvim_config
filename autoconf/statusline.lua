
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


function _G.modifiedSymbol()
  if vim.bo.modified then
    return "꙳"
  else
    return " "
  end
end

vim.defer_fn(function()       -- defer custom highlight, apply after colorscheme
  vim.cmd("highlight StatusModifiedColor guifg=#F91C49 guibg=#1C1C1C")
end, 50)


vim.o.statusline =
    " %{v:lua.getModeName()} " ..
    " %t" ..                        -- filename
    "%#StatusModifiedColor#" ..     -- start red
    "%{v:lua.modifiedSymbol()}" ..  -- the modified symbol in red
    "%*" ..                         -- reset to the default color
    " %l,%c " ..                    -- display row, column
    " %p%% "                        -- % of file

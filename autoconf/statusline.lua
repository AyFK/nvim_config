
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
    return "[✗]"
  else
    return "[✓]"
  end
end

vim.o.statusline =
    " %{v:lua.getModeName()} " .. -- display mode
    " %t " ..                     -- file name (only the tail)
    " %l,%c " ..                  -- current line and column
    " %p%% " ..                   -- percentage through the file
    --"%=" ..                       -- right-align next section
    " %{v:lua.modifiedSymbol()}"  -- custom modified indicator



--"——————————————————
--" WARNING : AI SLOP
--"——————————————————
--"
local function toggle_current_split()
  local cur_win = vim.api.nvim_get_current_win()
  local cur_pos = vim.api.nvim_win_get_position(cur_win)  -- {row, col}
  local cur_height = vim.api.nvim_win_get_height(cur_win)
  local cur_width = vim.api.nvim_win_get_width(cur_win)

  local cur_bounds = {
    top = cur_pos[1],
    left = cur_pos[2],
    bottom = cur_pos[1] + cur_height,
    right = cur_pos[2] + cur_width,
  }

  local function get_bounds(win)
    local pos = vim.api.nvim_win_get_position(win)
    local height = vim.api.nvim_win_get_height(win)
    local width = vim.api.nvim_win_get_width(win)
    return { top = pos[1], left = pos[2], bottom = pos[1] + height, right = pos[2] + width }
  end

  -- Define a helper to allow a small tolerance
  local function near(a, b, tol)
    return math.abs(a - b) <= tol
  end

  local tolerance = 1  -- adjust this if needed

  local wins = vim.api.nvim_tabpage_list_wins(0)
  local neighbor_win = nil
  for _, win in ipairs(wins) do
    if win ~= cur_win then
      local b = get_bounds(win)
      -- Check for horizontal adjacency:
      local vertical_overlap = not (b.bottom <= cur_bounds.top or b.top >= cur_bounds.bottom)
      local horizontal_adjacent = near(b.right, cur_bounds.left, tolerance) or near(b.left, cur_bounds.right, tolerance)
      if vertical_overlap and horizontal_adjacent then
        neighbor_win = win
        break
      end
      -- Check for vertical adjacency:
      local horizontal_overlap = not (b.right <= cur_bounds.left or b.left >= cur_bounds.right)
      local vertical_adjacent = near(b.bottom, cur_bounds.top, tolerance) or near(b.top, cur_bounds.bottom, tolerance)
      if horizontal_overlap and vertical_adjacent then
        neighbor_win = win
        break
      end
    end
  end

  if not neighbor_win then
    vim.notify("No adjacent split found", vim.log.levels.WARN)
    return
  end

  local neighbor_bounds = get_bounds(neighbor_win)
  local split_cmd
  if near(neighbor_bounds.right, cur_bounds.left, tolerance) or near(neighbor_bounds.left, cur_bounds.right, tolerance) then
    split_cmd = "split"  -- current is side-by-side, so change to horizontal split
  elseif near(neighbor_bounds.bottom, cur_bounds.top, tolerance) or near(neighbor_bounds.top, cur_bounds.bottom, tolerance) then
    split_cmd = "vsplit" -- current is stacked, so change to vertical split
  else
    vim.notify("Could not determine split orientation", vim.log.levels.WARN)
    return
  end

  local cur_buf = vim.api.nvim_win_get_buf(cur_win)
  local neighbor_buf = vim.api.nvim_win_get_buf(neighbor_win)
  vim.api.nvim_win_close(neighbor_win, true)
  vim.cmd(split_cmd)
  vim.api.nvim_set_current_buf(neighbor_buf)
  vim.api.nvim_set_current_win(cur_win)
end

vim.api.nvim_create_user_command("Re", toggle_current_split, {})


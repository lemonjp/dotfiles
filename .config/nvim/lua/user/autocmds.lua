-- Autocommands — translated from .vim/config.vim and old init.vim
local group = vim.api.nvim_create_augroup("user_autocmds", { clear = true })
local au = vim.api.nvim_create_autocmd

-- Java / PHP use 4-space indent (was: fileTypeIndent augroup)
au("FileType", {
  group = group,
  pattern = { "java", "php" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- Strip trailing whitespace on save (was: BufWritePre * :%s/\s\+$//e)
au("BufWritePre", {
  group = group,
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[silent! keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Center the focused file in the nvim-tree window when you switch to a real
-- buffer (pairs with update_focused_file in plugins.lua). nvim-tree moves its
-- cursor onto the file on BufEnter; we defer with vim.schedule so the centering
-- runs after that, then `zz` the tree window.
local function nvim_tree_win()
  for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local b = vim.api.nvim_win_get_buf(w)
    if vim.bo[b].filetype == "NvimTree" then
      return w
    end
  end
end

au("BufEnter", {
  group = group,
  callback = function()
    if vim.bo.buftype ~= "" then
      return -- only real file buffers, not the tree/help/quickfix/etc.
    end
    local tw = nvim_tree_win()
    if not tw then
      return
    end
    vim.schedule(function()
      if vim.api.nvim_win_is_valid(tw) then
        vim.api.nvim_win_call(tw, function()
          vim.cmd("normal! zz")
        end)
      end
    end)
  end,
})

-- Markdown tweaks (from old init.vim): no spell, soft wrapping
au("FileType", {
  group = group,
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

-- Keymaps — reproduce the old leader/plugin shortcuts on their Lua equivalents
local map = vim.keymap.set

-- Insert today's date (was: iabbrev ddate)
vim.cmd([[iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>]])

-- File tree (nvim-tree) — replaces NERDTree
map("n", "<C-e>", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
map("n", "<leader>nf", "<cmd>NvimTreeFindFile<CR>", { silent = true, desc = "Reveal current file in tree" })

-- Fuzzy finder (telescope) — replaces CtrlP / ag.vim / bufexplorer
map("n", "<leader>.", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>m", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files (MRU)" })
map("n", "<leader>ag", "<cmd>Telescope live_grep<CR>", { desc = "Grep (live)" })
map("n", "<leader>as", "<cmd>Telescope grep_string<CR>", { desc = "Grep word under cursor" })
-- <C-l>: open buffer list (MRU, current buffer hidden so the alternate file
-- is the top entry). Press <C-l> again inside the list to jump straight to it
-- -- i.e. tapping <C-l><C-l> toggles to the previously edited file, like vim.
map("n", "<C-l>", function()
  require("telescope.builtin").buffers({
    sort_mru = true,
    ignore_current_buffer = true,
    initial_mode = "normal", -- start in normal mode: j/k select, i to filter

    attach_mappings = function(_, lmap)
      local actions = require("telescope.actions")
      lmap("i", "<C-l>", actions.select_default)
      lmap("n", "<C-l>", actions.select_default)
      -- Close the buffer under the cursor without leaving the list:
      -- dd (vim-like) in normal mode, <C-d> in either mode.
      lmap("n", "dd", actions.delete_buffer)
      lmap("n", "<C-d>", actions.delete_buffer)
      lmap("i", "<C-d>", actions.delete_buffer)
      return true
    end,
  })
end, { desc = "Buffers (C-l C-l = alternate file)" })

-- Git (vim-fugitive) — same shortcuts as before, modern commands
map("n", "<leader>gc", "<cmd>Git commit -v<CR>", { desc = "Git commit" })
map("n", "<leader>gca", "<cmd>Git commit -a -v<CR>", { desc = "Git commit -a" })
map("n", "<leader>gw", "<cmd>Gwrite<CR>", { desc = "Git add (write)" })
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
map("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
map("n", "<leader>gu", "<cmd>Git pull<CR>", { desc = "Git pull (update)" })
map("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff (vertical)" })
map("n", "<leader>gx", "<cmd>wincmd h<CR><cmd>q<CR>", { desc = "Close diff window" })
map("n", "<leader>gi", ":Git ", { desc = "Git command prompt" })

-- Surround custom (vim-surround): wrap inner double-quote token in #{ }
map("n", "<leader>y#", "ysi\"#", { remap = true, desc = "Surround with #{}" })

-- Sessions (persistence.nvim) — bare `nvim` auto-restores this dir's session;
-- these are manual helpers for restoring/disabling on demand.
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session (this dir)" })
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop saving session" })

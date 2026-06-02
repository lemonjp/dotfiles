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
map("n", "<C-l>", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })

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

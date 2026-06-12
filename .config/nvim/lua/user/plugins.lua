-- Plugin specs for lazy.nvim — Lua equivalents of the old Vundle plugins
return {
  -- Colorscheme (look) — same molokai as before
  {
    "tomasr/molokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.rehash256 = 1
      vim.cmd.colorscheme("molokai")
    end,
  },

  -- Statusline — replaces lightline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "auto", globalstatus = false, section_separators = "", component_separators = "" },
      sections = {
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
      },
    },
  },

  -- File tree — replaces NERDTree (<C-e>, <leader>nf)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    opts = {
      filters = { dotfiles = false }, -- was NERDTreeShowHidden=1
      view = { width = 30 },
      renderer = { group_empty = true },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr) -- keep all default tree keys

        -- <leader>ag inside the tree: live_grep scoped to the directory under
        -- the cursor (a file node searches its parent dir). Outside the tree
        -- <leader>ag still greps the whole project (see keymaps.lua).
        vim.keymap.set("n", "<leader>ag", function()
          local node = api.tree.get_node_under_cursor()
          local path = (node and (node.absolute_path or node.link_to)) or vim.fn.getcwd()
          if not node or node.type ~= "directory" then
            path = vim.fn.fnamemodify(path, ":h")
          end
          require("telescope.builtin").live_grep({
            search_dirs = { path },
            prompt_title = "Grep in " .. vim.fn.fnamemodify(path, ":~:."),
          })
        end, { desc = "nvim-tree: live_grep under node", buffer = bufnr, silent = true, nowait = true })
      end,
    },
  },

  -- Fuzzy finder — replaces CtrlP / ag.vim / bufexplorer
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        -- Show the filename first, then the (dimmed) directory after it, so the
        -- filename stays visible even for deeply nested paths instead of being
        -- truncated off the right edge.
        path_display = { "filename_first" },
      },
    },
  },

  -- Treesitter — highlighting for all languages (replaces the syntax plugins)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "bash",
        "javascript", "typescript", "tsx", "vue",
        "html", "css", "scss", "json", "markdown", "markdown_inline",
        "java", "php",
      },
      highlight = { enable = true },
      indent = { enable = false }, -- keep cindent/autoindent behavior from before
    },
  },

  -- Auto-pairs — replaces the inoremap { } ( ) " ' < mappings
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Surround — kept as-is (works in nvim)
  {
    "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" },
    event = "VeryLazy",
    init = function()
      vim.g.surround_35 = "#{\r}" -- ysiw# -> #{ ... }
    end,
  },

  -- Emmet for HTML/CSS — kept
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "vue", "javascriptreact", "typescriptreact", "eruby", "php" },
  },

  -- Git — fugitive for the <leader>g* shortcuts, gitsigns for the gutter
  { "tpope/vim-fugitive", cmd = { "Git", "Gwrite", "Gvdiffsplit", "Gread" } },
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
}

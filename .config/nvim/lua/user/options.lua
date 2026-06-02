-- Editor options — translated 1:1 from the old .vim/config.vim
local opt = vim.opt

-- Color / UI
opt.termguicolors = true
opt.number = true
opt.ruler = true
opt.cursorline = true
opt.colorcolumn = "80"
opt.laststatus = 2
opt.cmdheight = 2
opt.title = true
opt.showmode = false -- the statusline shows the mode

-- Visual
opt.showmatch = true
opt.matchtime = 2
opt.list = true
opt.listchars = { tab = "^_", trail = "-", extends = ">", precedes = "<" }
opt.wrap = true

-- Indentation: 2-space expandtab (Java/PHP overridden to 4 in autocmds)
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.shiftround = true
opt.autoindent = true
opt.cindent = true
opt.smarttab = true

-- Misc
opt.tags = "./tags;"
opt.complete = ".,w,b,u,U"
opt.clipboard = "unnamedplus" -- use the system clipboard (from old init.vim)

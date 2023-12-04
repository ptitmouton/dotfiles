local opt = vim.opt

opt.syntax="on"

opt.encoding="UTF-8"
opt.ruler = true

-- line number
opt.number = true
opt.relativenumber = true

-- default to tabwidth 2
opt.tabstop=2
opt.shiftwidth=2
opt.expandtab = true
opt.autoindent = true

-- mouse support
opt.mouse="a"

-- line wrap
opt.wrap = false

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- Open splits below and right (instead of top and left)
opt.splitbelow = true
opt.splitright = true

-- More space for displaying messages
opt.cmdheight = 2
opt.shortmess = "aFc"

-- autoscroll terminal
vim.g.neoterm_autoscroll = true

-- Make json quotes not being nastily hidden
-- This was caused by identLine setting concealLevel to 2
vim.g.indentLine_fileTypeExclude = {"json"}
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0



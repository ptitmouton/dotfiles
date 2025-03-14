local set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- tab navigation
set_keymap("n", "<C-T>h", ":tabp<CR>", {})
set_keymap("n", "<C-T>l", ":tabn<CR>", {})
set_keymap("n", "<C-T>x", ":tabclose<CR>", {})
set_keymap("n", "<C-T>c", ":tabnew<CR>", {})

-- Leave terminal with ESC
set_keymap("t", "<Leader><Esc>", "<C-\\><C-n>", { noremap = true })

-- split windows
set_keymap("n", "<Leader>vs", ":vsplit<CR>", { noremap = true })
set_keymap("n", "<Leader>hs", ":split<CR>", { noremap = true })

-- plugins

-- tig
set_keymap("n", "<Leader>Tf", ":TigOpenCurrentFile<CR>", { noremap = true })
set_keymap("n", "<Leader>TT", ":TigOpenProjectRootDir<CR>", { noremap = true })
set_keymap("n", "<Leader>Tb", ":TigBlame<CR>", { noremap = true })
set_keymap("n", "<Leader>Tl", ":TigLog<CR>", { noremap = true })
set_keymap("n", "<Leader>Ts", ":TigStatus<CR>", { noremap = true })
set_keymap("n", "<Leader>Td", ":TigDiff<CR>", { noremap = true })

vim.keymap.set("n", "<leader>cs", ":nohlsearch<CR>")

-- telescope
vim.keymap.set("n", "<leader>fg", ":Telescope git_files<CR>")
vim.keymap.set("n", "<C-p>", ":Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

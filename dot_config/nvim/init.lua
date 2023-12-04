require('plugins')
require('colorscheme')
require('settings')
require('keymap')

require('plugins.comment')
require('plugins.cmp')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.web-devicons')

require('plugins.lsp.lspconfig')
require('plugins.lsp.mason')
require('plugins.lsp.null-ls')

--[[

"set test terminal position below
let g:test#neovim#term_position = "belowright"

set completeopt=longest,noselect,menuone
set omnifunc=ale#syntaxcomplete#Complete



" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
]]--



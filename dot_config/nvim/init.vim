let g:mapleader=","

" Add node_modules to PATH if it is available
if isdirectory($PWD .'/node_modules')
    let $PATH .= ':' . $PWD . '/node_modules/.bin'
endif

 if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'github/copilot.vim'
Plug 'mhinz/vim-startify'

Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }

Plug 'mattn/webapi-vim' " utility to call Web APIs, is dependency of multiple other plugins

Plug 'ryanoasis/vim-devicons' " icons everywhere!

Plug 'itchyny/lightline.vim'

Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-surround'

" indentation Line
Plug 'Yggdroot/indentLine'

" formatting
Plug 'sbdchd/neoformat'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" complete words from other tmux sessions
Plug 'wellle/tmux-complete.vim'

" jest integration
Plug 'vim-test/vim-test'

Plug 'briancollins/vim-jst' "EJS (Embedded Javascript)
Plug 'Glench/Vim-Jinja2-Syntax' "Jinja2 / Nunjuck  templating syntax

" typescript vim syntax
Plug 'leafgarland/typescript-vim'

" graphql vim syntax
Plug 'jparise/vim-graphql'

Plug 'iberianpig/tig-explorer.vim' "tig integration

Plug 'rbgrouleff/bclose.vim' "tig integration dependency

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" YATS for syntax file.
Plug 'HerringtonDarkholme/yats.vim'


" typescript support
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" elixir support
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'lucidstack/hex.vim'

" php support
Plug 'lvht/phpcd.vim'

" Dockerfile support
Plug 'ekalinin/dockerfile.vim'

" helm support
Plug 'towolf/vim-helm'


" tmux support
Plug 'christoomey/vim-tmux-navigator' "navigate between vim and tmux panes
Plug 'tmux-plugins/vim-tmux' "tmux.conf language conf


Plug 'tmux-plugins/vim-tmux-focus-events' "terminal vim FocusGained & FocusLost events

"COC and COC plugins
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'antonk52/coc-cssmodules', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-docker', {'do': 'yarn install --frozen-lockfile'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-sql', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-xml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}


"
" Themes
"
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim', {'as': 'nord'}
Plug 'mhartington/oceanic-next', {'as': 'oceanic'}
Plug 'joshdick/onedark.vim'


call plug#end()

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set encoding=UTF-8

set ruler
set number " show current line number
set relativenumber " relative line numbers

" standard tab width 2
set tabstop=2
set shiftwidth=2
set expandtab

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = 'â”†'
let g:indentLine_faster = 1


set mouse=a " mouse support

"""
" Syntax
"""
syntax on
colorscheme OceanicNext

" tab navigation
map <C-T>h :tabp<CR>
map <C-T>l :tabn<CR>
map <C-T>x :tabclose<CR>
map <C-T>c :tabnew<CR>

"tig navigation
nnoremap <Leader>Tf :TigOpenCurrentFile<CR>
nnoremap <Leader>TT :TigOpenProjectRootDir<CR>
nnoremap <Leader>Tgr :TigGrep<CR>
nnoremap <Leader>Tc :TigGrepResume<CR>
" open tig grep with the selected word
vnoremap <Leader>Tgw y:TigGrep<Space><C-R>"<CR>
" open tig grep with the word under the cursor
nnoremap <Leader>Tcg :<C-u>:TigGrep<Space><C-R><C-W><CR>
" open tig blame with current file
nnoremap <Leader>Tb :TigBlame<CR>

nnoremap <Leader>t :TestFile<CR>

nnoremap <Leader>f :CocFix<CR>

map <C-p> :Files<CR>
map <Leader><C-p> :GFiles<CR>
map <C-f> :Ag 

" Leave terminal with ESC
tnoremap <Leader><Esc> <C-\><C-n>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

nmap <space>e :CocCommand explorer<CR>


"""
" Search
"""
set hlsearch
set incsearch
"smartcase search (only case-sensitive search when search query contains an uppercase letter
set smartcase

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif


let g:neoterm_autoscroll = 1 "autoscroll terminal

"set test terminal position below
let g:test#neovim#term_position = "belowright"

" Open new splits below and right (instead of top and left)
set splitbelow
set splitright

set completeopt=longest,noselect,menuone
set omnifunc=ale#syntaxcomplete#Complete


"""
"Coc configuration
"""

" Give more space for displaying messages.
set cmdheight=2
set shortmess=aFc

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

augroup vimrc-c
    autocmd!
    autocmd FileType c setlocal completeopt+=menu,preview
augroup END

augroup vimrc-javascript
    autocmd!
    autocmd BufNewFile,BufRead *.js setlocal filetype=javascript tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascriptreact tabstop=4 shiftwidth=4
    autocmd BufWritePre *.jsx Neoformat
    autocmd BufWritePre *.js Neoformat
augroup END

""" typescript
augroup vimrc-typescript
    autocmd!
    autocmd FileType typescript setlocal completeopt+=menu,preview
    autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescriptreact tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript tabstop=4 shiftwidth=4
    autocmd BufWritePre *.tsx Neoformat prettier
    autocmd BufWritePre *.ts Neoformat prettier
augroup END

""" CSS / SCSS
augroup vimrc-css
    autocmd!
    autocmd FileType css setlocal completeopt+=menu,preview
    autocmd BufNewFile,BufRead *.css setlocal filetype=css tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.scss setlocal filetype=scss tabstop=4 shiftwidth=4
    autocmd BufWritePre *.css Neoformat prettier
    autocmd BufWritePre *.scss Neoformat prettier
augroup END

""" GraphQL
augroup vimrc-graphql
    autocmd!
    autocmd BufWritePre *.graphql Neoformat prettier
augroup END

"" jinja templates
augroup vimrc-jinja
    autocmd!
    autocmd BufNewFile,BufRead *.njk setlocal filetype=jinja.html
augroup END

"" elixir
augroup vimrc-elixir
    autocmd!
    autocmd BufNewFile,BufRead *.exs setlocal filetype=elixir
    autocmd BufWritePre *.ex Neoformat
    autocmd BufWritePre *.exs Neoformat
augroup END

"" rust
augroup vimrc-rust
    autocmd!
    autocmd BufNewFile,BufRead *.rs setlocal filetype=rust
    autocmd BufWritePre *.rs Neoformat
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

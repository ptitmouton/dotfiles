vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'github/copilot.vim'

  use 'ryanoasis/vim-devicons'

  use "nathom/filetype.nvim"

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  use 'airblade/vim-gitgutter'

  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'

  -- indentation Line
  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use 'lewis6991/gitsigns.nvim'

  -- tig integration
  use {
    'iberianpig/tig-explorer.vim',
    requires = {
      'rbgrouleff/bclose.vim'
    }
  }

  -- tmux support
  use 'christoomey/vim-tmux-navigator' -- navigate between vim and tmux panes
  use 'tmux-plugins/vim-tmux' -- tmux.conf language conf
  use 'tmux-plugins/vim-tmux-focus-events' -- terminal vim FocusGained & FocusLost events

  -- themes
  use { 'dracula/vim', as = 'dracula' }
  use { 'navarasu/onedark.nvim' }

  -- completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- lsp
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }
--   use {
--     "jose-elias-alvarez/null-ls.nvim",
--     config = function()
--       require("null-ls").setup()
--     end,
--     requires = { "nvim-lua/plenary.nvim" },
--   }

  -- tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        additional_vim_regex_highlighting = false,
      }

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.just = {
        install_info = {
          url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
          files = { "src/parser.c", "src/scanner.cc" },
          branch = "main",
        },
        maintainers = { "@IndianBoy42" },
      }
    end
  }

  use {
    "nathom/filetype.nvim",
    config = function()
      require("filetype").setup {
        overrides = {
          extensions = {
            tf = "terraform",
            tfvars = "terraform",
            tfstate = "json",
          }
        }
      }
    end
  }

  -- telescope (cmd-p thingy)
  use { "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

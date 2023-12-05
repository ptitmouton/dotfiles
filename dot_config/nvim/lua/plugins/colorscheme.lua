return {
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'darker'
    },
    init = function()
      local onedark = require('onedark')
      onedark.load()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme('onedark')
    end
  },
	'nvim-web-devicons',
	'vim-devicons',
}

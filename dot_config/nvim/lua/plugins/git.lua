return {
  -- tig integration
  {
    'iberianpig/tig-explorer.vim',
    dependencies = {
      'rbgrouleff/bclose.vim'
    }
  },

  {'lewis6991/gitsigns.nvim', -- Git annotations + git signs
    opts = {
      current_line_blame = false
    }
  },

  {'akinsho/git-conflict.nvim', -- git diff visualization
    version = "*",
    config = true
  },
}

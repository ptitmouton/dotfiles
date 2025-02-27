return {
  -- tig integration
  {
    'iberianpig/tig-explorer.vim',
    dependencies = {
      'rbgrouleff/bclose.vim'
    }
  },

  {
    'lewis6991/gitsigns.nvim', -- Git annotations + git signs
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = '+', },
        change = { text = '│', },
        delete = { text = '_', },
        topdelete = { text = '‾', },
        changedelete = { text = '~', },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gb', '<cmd>lua require"gitsigns".blame_line()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gh', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gR', '<cmd>lua require"gitsigns".reset_buffer()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gS', '<cmd>lua require"gitsigns".stage_buffer()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>gU', '<cmd>lua require"gitsigns".undo_stage_buffer()<CR>', { buffer = bufnr })

        highlight_groups = {
          'GitSignsAdd',
          'GitSignsAddNr',
          'GitSignsAddLn',
          'GitSignsChange',
          'GitSignsChangeRn',
          'GitSignsChangeLn',
          'GitSignsDelete',
          'GitSignsDeleteRn',
          'GitSignsDeleteLn',
          'GitSignsTopdeletelete',
          'GitSignsTopdeleteleteRn',
          'GitSignsTopdeleteleteLn',
          'GitSignsChangedeletelete',
          'GitSignsChangedeleteleteRn',
          'GitSignsChangedeleteleteLn',
        }
        for _, group in ipairs(highlight_groups) do
          vim.api.nvim_set_hl(0, group, { link = group })
        end
      end
    },
  },

  {
    'akinsho/git-conflict.nvim', -- git diff visualization
    version = "*",
    config = true
  },
}

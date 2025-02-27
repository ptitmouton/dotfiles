return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
      },
    },
  },
  opts = {
    init = function()
      local telescope = require("telescope")
      telescope.load_extension('fzf')
    end,
    defaults = {
      mappings = {
        i = {
          -- ["<C-j>"] = actions.move_selection_next,
          -- ["<C-k>"] = actions.move_selection_previous,
          -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        }
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,               -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
      },
      dash = {}
    }
  }
}

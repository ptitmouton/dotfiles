return {
  {
    "neovim/nvim-lspconfig",
    event = "FileType",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim",  opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },

    config = function(_, opts)
      local register_capability = vim.lsp.handlers["client/registerCapability"]

      vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
        local ret = register_capability(err, res, ctx)
        local client_id = ctx.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local buffer = vim.api.nvim_get_current_buf()

        local key_opts = { noremap = true, silent = true, buffer = buffer }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, key_opts)
        vim.keymap.set('n', '<leader>lf', vim.lsp.buf.declaration, key_opts)
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, key_opts)
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, key_opts)
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, key_opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, key_opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, key_opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, key_opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, key_opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, key_opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, key_opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, key_opts)
        vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, key_opts)

        if client.name == 'tsserver' then
          vim.keymap.set('n', '<leader>rf', ':TypescriptRenameFile<CR>', key_opts)
          vim.keymap.set('n', '<leader>gs', '<cmd>TSLspOrganize<CR>', key_opts)
          vim.keymap.set('n', '<leader>gi', '<cmd>TSLspImportAll<CR>', key_opts)
        end

        return ret
      end

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end,
  },
  -- none-ls
  {
    "nvimtools/none-ls.nvim",
    event = "FileType",
    dependencies = { "mason.nvim" },
  },

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  {
    'elentok/format-on-save.nvim',
    config = function(_, _)
      local format_on_save = require("format-on-save")
      local formatters = require("format-on-save.formatters")
      local prettierd = formatters.shell({ cmd = { "prettier", "%" } })

      format_on_save.setup({
        exclude_path_patterns = {
          "/node_modules/",
          ".local/share/nvim/lazy",
        },
        formatter_by_ft = {
          css = formatters.lsp,
          html = formatters.lsp,
          java = formatters.lsp,
          json = formatters.lsp,
          elixir = formatters.lsp,
          lua = formatters.lsp,
          markdown = prettierd,
          openscad = formatters.lsp,
          rust = formatters.lsp,
          scad = formatters.lsp,
          scss = formatters.lsp,
          sh = formatters.shfmt,
          terraform = formatters.lsp,
          typescript = prettierd,
          typescriptreact = prettierd,
          yaml = formatters.lsp,

          -- Add your own shell formatters:
          myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

          -- Add lazy formatter that will only run when formatting:
          my_custom_formatter = function()
            if vim.api.nvim_buf_get_name(0):match("/README.md$") then
              return prettierd
            else
              return formatters.lsp()
            end
          end,

          -- Add custom formatter
          filetype1 = formatters.remove_trailing_whitespace,
          filetype2 = formatters.custom({
            format = function(lines)
              return vim.tbl_map(function(line)
                return line:gsub("true", "false")
              end, lines)
            end
          }),

          -- Concatenate formatters
          python = {
            formatters.remove_trailing_whitespace,
            formatters.shell({ cmd = "tidy-imports" }),
            formatters.black,
            formatters.ruff,
          },

          -- Use a tempfile instead of stdin
          go = {
            formatters.shell({
              cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
              tempfile = function()
                return vim.fn.expand("%") .. '.formatter-temp'
              end
            }),
            formatters.shell({ cmd = { "gofmt" } }),
          },

          -- Add conditional formatter that only runs if a certain file exists
          -- in one of the parent directories.
          javascript = {
            formatters.if_file_exists({
              pattern = ".eslintrc.*",
              formatter = formatters.eslint_d_fix
            }),
            formatters.if_file_exists({
              pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
              formatter = prettierd,
            }),
            -- By default it stops at the git repo root (or "/" if git repo not found)
            -- but it can be customized with the `stop_path` option:
            formatters.if_file_exists({
              pattern = ".prettierrc",
              formatter = prettierd,
              stop_path = function()
                return "/my/custom/stop/path"
              end
            }),
          },
        },

        -- Optional: fallback formatter to use when no formatters match the current filetype
        fallback_formatter = {
          formatters.remove_trailing_whitespace,
          formatters.remove_trailing_newlines,
          prettierd,
        },

        -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
        -- To prevent that set `run_with_sh` to `false`.
        run_with_sh = false,
      })
    end
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  }
}

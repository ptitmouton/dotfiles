return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"bashls",
				"clangd",
				"cmake",
				"cssls",
				"cssmodules_ls",
				"dockerls",
				"elixirls",
				"gopls",
				"graphql",
				"html",
				"jdtls",
				"jsonls",
				"lua_ls",
				"prismals",
				"remark_ls",
				"rust_analyzer",
				"spectral",
				"sqls",
				"stylelint_lsp",
				"tailwindcss",
				"tflint",
				"ts_ls",
				"vuels",
				"yamlls",
				"asm_lsp",
				"vimls",
			},
      handlers = {
        -- default handler
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
        ["elixirls"] = function()
          lspconfig.elixirls.setup({
            capabilities = capabilities,
            cmd = { "elixir-ls" },
          })
        end,
        ["nextls"] = function()
          lspconfig.nextls.setup({
            capabilities = capabilities,
            cmd = { "nextls" },
          })
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
              pyright = {
                disableOrganizeImports = true,
              },
              python = {
                analysis = {
                  ignore = { "*" },
                },
              },
            },
          })
        end,
      },
		})
	end,
}

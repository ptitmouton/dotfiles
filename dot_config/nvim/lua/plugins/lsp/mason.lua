return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

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
		})
	end,
}

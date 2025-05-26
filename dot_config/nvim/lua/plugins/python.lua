return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	branch = "regexp", -- This is the regexp branch, use this for the new version
	keys = {
		{ "<leader>pysv", "<cmd>VenvSelect<cr>" },
	},
	---@type venv-selector.Confeg
	opts = {
		-- Your settings go here
	},
	config = function(_, _)
		vim.api.nvim_create_autocmd("VimEnter", {
			desc = "Auto select virtualenv Nvim open",
			pattern = "*",
			callback = function()
				local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
				if venv ~= "" then
					require("venv-selector").retrieve_from_cache()
				end
			end,
			once = true,
		})
	end,
}

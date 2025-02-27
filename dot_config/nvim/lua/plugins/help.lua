return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"mrjones2014/dash.nvim",
		build = "make install",
		-- build = function()
		--   local job = require("plenary.job")
		--   job:new({
		--     command = "make install",
		--     cwd = vim.fn.stdpath("data") .. "/lazy/dash.nvim",
		--   }):sync()
		-- end,
	},
}

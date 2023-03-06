local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nyoom-engineering/oxocarbon.nvim")
	use("folke/tokyonight.nvim")
	use("bluz71/vim-nightfly-colors")
	use("nvim-lualine/lualine.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("akinsho/toggleterm.nvim")
	use("xiyaowong/nvim-transparent")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("andweeb/presence.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("windwp/nvim-autopairs")
	use("NvChad/nvim-colorizer.lua")
	use("lewis6991/gitsigns.nvim")
	use({ "bluz71/vim-moonfly-colors", branch = "cterm-compat" })
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	})
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				stages = "fade_in_slide_out",
				background_colour = "FloatShadow",
				timeout = 3000,
			})
			vim.notify = require("notify")
		end,
	})
	use({
		"NTBBloodbath/galaxyline.nvim",
		config = function()
			require("galaxyline.themes.eviline")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	})
	-- use({
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup({
	-- 			{
	-- 				welcome_message = "Sasuga mastah~", -- set to "" if you don't like the fancy godot robot
	-- 				loading_text = "loading",
	-- 				question_sign = "", -- you can use emoji if you want e.g. 🙂
	-- 				answer_sign = "ﮧ", -- 🤖
	-- 				max_line_length = 120,
	-- 				yank_register = "+",
	-- 				chat_layout = {
	-- 					relative = "editor",
	-- 					position = "50%",
	-- 					size = {
	-- 						height = "80%",
	-- 						width = "80%",
	-- 					},
	-- 				},
	-- 				settings_window = {
	-- 					border = {
	-- 						style = "rounded",
	-- 						text = {
	-- 							top = " Settings ",
	-- 						},
	-- 					},
	-- 				},
	-- 				chat_window = {
	-- 					filetype = "chatgpt",
	-- 					border = {
	-- 						highlight = "FloatBorder",
	-- 						style = "rounded",
	-- 						text = {
	-- 							top = " ChatGPT ",
	-- 						},
	-- 					},
	-- 				},
	-- 				chat_input = {
	-- 					prompt = "  ",
	-- 					border = {
	-- 						highlight = "FloatBorder",
	-- 						style = "rounded",
	-- 						text = {
	-- 							top_align = "center",
	-- 							top = " Prompt ",
	-- 						},
	-- 					},
	-- 				},
	-- 				openai_params = {
	-- 					model = "text-davinci-003",
	-- 					frequency_penalty = 0,
	-- 					presence_penalty = 0,
	-- 					max_tokens = 300,
	-- 					temperature = 0,
	-- 					top_p = 1,
	-- 					-- n = 1,
	-- 				},
	-- 				openai_edit_params = {
	-- 					model = "code-davinci-edit-001",
	-- 					temperature = 0,
	-- 					top_p = 1,
	-- 					n = 1,
	-- 				},
	-- 				keymaps = {
	-- 					close = { "<C-c>", "<Esc>" },
	-- 					yank_last = "<C-y>",
	-- 					scroll_up = "<C-u>",
	-- 					scroll_down = "<C-d>",
	-- 					toggle_settings = "<C-o>",
	-- 					new_session = "<C-n>",
	-- 					cycle_windows = "<Tab>",
	-- 					-- in the Sessions pane
	-- 					select_session = "<Space>",
	-- 					rename_session = "r",
	-- 					delete_session = "d",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- })

	if packer_bootstrap then
		require("packer").sync()
	end
end)

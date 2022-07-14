local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- util libs
	use("nvim-lua/plenary.nvim")

	use("machakann/vim-sandwich")

	-- ui plugins
	use("kyazdani42/nvim-web-devicons")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				filters = {
					dotfiles = true,
					exclude = {
						".git",
						"dist",
						"out",
						"build",
						"node_modules",
					},
				},
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = { "c", "lua", "rust" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- List of parsers to ignore installing (for "all")
				ignore_install = { "javascript" },

				highlight = {
					-- `false` will disable the whole extension
					enable = true,

					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					disable = { "c", "rust" },

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	})

	use({ "maxxnino/tree-sitter-zig" })

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")

			vim.opt.termguicolors = true
			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
			vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

			require("indent_blankline").setup({
				-- for example, context is off by default, use this to turn it on
				show_current_context = true,
				show_current_context_start = true,
				show_end_of_line = true,
				space_char_blankline = " ",
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
					"IndentBlanklineIndent3",
					"IndentBlanklineIndent4",
					"IndentBlanklineIndent5",
					"IndentBlanklineIndent6",
				},
			})
		end,
	})

	-- navigation stuff
	use("RyanMillerC/better-vim-tmux-resizer")
	use("christoomey/vim-tmux-navigator")
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			vim.api.nvim_set_keymap(
				"",
				"f",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>",
				{}
			)
			vim.api.nvim_set_keymap(
				"",
				"F",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>",
				{}
			)
		end,
	})

	-- quick jump files
	use("nvim-telescope/telescope-fzf-native.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
			-- To get fzf loaded and working with jelescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
		end,
	})

	-- git
	use("TimUntersberger/neogit")
	use("lewis6991/gitsigns.nvim")

	-- keyboard shortcut
	use("anuvyklack/keymap-layer.nvim")
	use({
		"anuvyklack/hydra.nvim",
		config = function()
			require("config.hydra")
		end,
	})

	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/vim-vsnip-integ" })
	use({ "hrsh7th/cmp-vsnip" })

	-- lspconfig
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"anuvyklack/hydra.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("config.lsp")
		end,
	})

	-- code format
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.completion.spell,
					require("null-ls").builtins.diagnostics.eslint_d,
					require("null-ls").builtins.code_actions.eslint_d,
					require("null-ls").builtins.formatting.eslint_d,
					require("null-ls").builtins.formatting.zigfmt,
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.code_actions.shellcheck,
					require("null-ls").builtins.diagnostics.shellcheck,
					require("null-ls").builtins.formatting.shfmt,
				},
				-- you can reuse a shared lspconfig on_attach callback here
				on_attach = function(client, bufnr)
					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							vim.lsp.buf.formatting_sync(nil, 100000)
						end,
					})
				end,
			})
		end,
	})

	use({
		"renerocksai/telekasten.nvim",
		config = function()
			require("config.note")
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end

	-- note
end)

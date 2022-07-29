local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
	size = 20,
	open_mapping = [[<c-\>]],
	direction = "horizontal",
})

local node = Terminal:new({
	cmd = "node",
	hidden = true,
	direction = "float",
})
function _node_toggle()
	node:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua _node_toggle()<CR>", { noremap = true, silent = true })

local htop = Terminal:new({
	cmd = "htop",
	hidden = true,
	direction = "float",
})
function _htop_toggle()
	htop:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua _htop_toggle()<CR>", { noremap = true, silent = true })

local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
})
function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

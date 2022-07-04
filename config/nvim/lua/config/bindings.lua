-- mode - n/i
function map(mode, keyBinding, command, opts)
        local options = { noremap = true }
        if opts then
                options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode, keyBinding, command, options)
end

map("n", "<C-b>", "<cmd>Telescope buffers<cr>")
map("n", "<C-o>", "<cmd>Telescope find_files<cr>")
map("n", "<Tab>", "<cmd>NvimTreeFindFileToggle<cr>")
map("n", "z", "<cmd>Telekasten panel<cr>")


-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/zhengzekai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/zhengzekai/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/zhengzekai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/zhengzekai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/zhengzekai/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["better-vim-tmux-resizer"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/better-vim-tmux-resizer",
    url = "https://github.com/RyanMillerC/better-vim-tmux-resizer"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n±\3\0\0\6\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\n\0'\4\v\0004\5\0\0B\0\5\1K\0\1\0ƒ\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>\6F‚\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>\6f\5\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["hydra.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.hydra\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n²\a\0\0\4\0\21\00076\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\b\0'\2\t\0B\0\2\0016\0\0\0009\0\b\0'\2\n\0B\0\2\0016\0\0\0009\0\b\0'\2\v\0B\0\2\0016\0\0\0009\0\b\0'\2\f\0B\0\2\0016\0\0\0009\0\b\0'\2\r\0B\0\2\0016\0\0\0009\0\b\0'\2\14\0B\0\2\0016\0\15\0'\2\16\0B\0\2\0029\0\17\0005\2\18\0005\3\19\0=\3\20\2B\0\2\1K\0\1\0\24char_highlight_list\1\a\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent3\27IndentBlanklineIndent4\27IndentBlanklineIndent5\27IndentBlanklineIndent6\1\0\4\25space_char_blankline\6 \21show_end_of_line\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequireAhighlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombineAhighlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombineAhighlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombineAhighlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombineAhighlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombineAhighlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine\bcmd\18termguicolors\feol:â†´\14space:â‹…\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["keymap-layer.nvim"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/keymap-layer.nvim",
    url = "https://github.com/anuvyklack/keymap-layer.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nF\0\0\4\0\4\1\b6\0\0\0009\0\1\0009\0\2\0009\0\3\0+\2\0\0*\3\0\0B\0\3\1K\0\1\0\20formatting_sync\bbuf\blsp\bvimÀš\f³\2\1\2\b\0\17\0 6\2\0\0009\2\1\0029\2\2\2'\4\3\0004\5\0\0B\2\3\0029\3\4\0'\5\5\0B\3\2\2\14\0\3\0X\4\3€9\3\6\0\a\3\a\0X\3\17€6\3\0\0009\3\1\0039\3\b\0035\5\t\0=\2\n\5=\1\v\5B\3\2\0016\3\0\0009\3\1\0039\3\f\3'\5\r\0005\6\14\0=\2\n\6=\1\v\0063\a\15\0=\a\16\6B\3\3\1K\0\1\0\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bzls\tname\28textDocument/formatting\20supports_method\18LspFormatting\24nvim_create_augroup\bapi\bvimÜ\2\1\0\a\0\16\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0004\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\a\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\a\4>\4\4\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\n\4>\4\5\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\v\4>\4\6\3=\3\r\0023\3\14\0=\3\15\2B\0\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\vstylua\vzigfmt\15formatting\17code_actions\reslint_d\16diagnostics\nspell\15completion\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n[\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ffilters\1\0\0\1\0\1\rdotfiles\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nƒ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\14highlight\fdisable\1\3\0\0\6c\trust\1\0\2&additional_vim_regex_highlighting\1\venable\2\19ignore_install\1\2\0\0\15javascript\21ensure_installed\1\0\1\17sync_install\1\1\4\0\0\6c\blua\trust\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telekasten.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.note\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÕ\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tree-sitter-zig"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/tree-sitter-zig",
    url = "https://github.com/maxxnino/tree-sitter-zig"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/zhengzekai/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n[\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ffilters\1\0\0\1\0\1\rdotfiles\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÕ\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nƒ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\14highlight\fdisable\1\3\0\0\6c\trust\1\0\2&additional_vim_regex_highlighting\1\venable\2\19ignore_install\1\2\0\0\15javascript\21ensure_installed\1\0\1\17sync_install\1\1\4\0\0\6c\blua\trust\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n±\3\0\0\6\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\n\0'\4\v\0004\5\0\0B\0\5\1K\0\1\0ƒ\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>\6F‚\1<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>\6f\5\20nvim_set_keymap\bapi\bvim\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n²\a\0\0\4\0\21\00076\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\b\0'\2\t\0B\0\2\0016\0\0\0009\0\b\0'\2\n\0B\0\2\0016\0\0\0009\0\b\0'\2\v\0B\0\2\0016\0\0\0009\0\b\0'\2\f\0B\0\2\0016\0\0\0009\0\b\0'\2\r\0B\0\2\0016\0\0\0009\0\b\0'\2\14\0B\0\2\0016\0\15\0'\2\16\0B\0\2\0029\0\17\0005\2\18\0005\3\19\0=\3\20\2B\0\2\1K\0\1\0\24char_highlight_list\1\a\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent3\27IndentBlanklineIndent4\27IndentBlanklineIndent5\27IndentBlanklineIndent6\1\0\4\25space_char_blankline\6 \21show_end_of_line\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequireAhighlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombineAhighlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombineAhighlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombineAhighlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombineAhighlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombineAhighlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine\bcmd\18termguicolors\feol:â†´\14space:â‹…\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telekasten.nvim
time([[Config for telekasten.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.note\frequire\0", "config", "telekasten.nvim")
time([[Config for telekasten.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\4\0\4\1\b6\0\0\0009\0\1\0009\0\2\0009\0\3\0+\2\0\0*\3\0\0B\0\3\1K\0\1\0\20formatting_sync\bbuf\blsp\bvimÀš\f³\2\1\2\b\0\17\0 6\2\0\0009\2\1\0029\2\2\2'\4\3\0004\5\0\0B\2\3\0029\3\4\0'\5\5\0B\3\2\2\14\0\3\0X\4\3€9\3\6\0\a\3\a\0X\3\17€6\3\0\0009\3\1\0039\3\b\0035\5\t\0=\2\n\5=\1\v\5B\3\2\0016\3\0\0009\3\1\0039\3\f\3'\5\r\0005\6\14\0=\2\n\6=\1\v\0063\a\15\0=\a\16\6B\3\3\1K\0\1\0\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bzls\tname\28textDocument/formatting\20supports_method\18LspFormatting\24nvim_create_augroup\bapi\bvimÜ\2\1\0\a\0\16\00056\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0004\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\a\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\a\4>\4\4\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\n\4>\4\5\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\v\4>\4\6\3=\3\r\0023\3\14\0=\3\15\2B\0\2\1K\0\1\0\14on_attach\0\fsources\1\0\0\vstylua\vzigfmt\15formatting\17code_actions\reslint_d\16diagnostics\nspell\15completion\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.hydra\frequire\0", "config", "hydra.nvim")
time([[Config for hydra.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

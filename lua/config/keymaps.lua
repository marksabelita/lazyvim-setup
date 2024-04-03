-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.opt.winbar = "%=%m %f"

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', opts)

--  Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "C-x")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<C-n>", "<cmd>silent !tmux neww tmax-sessionizer<CR>", opts)
keymap.set("n", "<leader>se", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left><Left>", opts)

-- Delete a word bacwards
keymap.set("n", "dw", "vb_d")
keymap.set("n", "<leader>di", "va{:<Backspace>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)
keymap.set("n", "<C-t>", ":tabnew<CR>", opts)

-- Tabs
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "<leader>t", ":split | terminal<CR>", opts)
keymap.set("n", "<C-q>", ":bwipeout!<CR>:bprevious<CR>", opts)
-- keymap.set("i", "<S-BS>", "<C-w>", opts)
keymap.set("i", "<C-W>", "<C-O>dB", opts)

--jumplist
keymap.set("n", "1", "10j")
keymap.set("n", "2", "20j")
keymap.set("n", "0", "10k")
keymap.set("n", "9", "20k")

--light theme
--
function customizeHighlights()
  local modifiable_was_enabled = vim.bo.modifiable

  -- Enable modifiability
  vim.bo.modifiable = true

  -- Execute the Vim commands to modify highlights
  vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
  vim.cmd("hi! NonText guibg=NONE ctermbg=NONE")

  -- Restore the modifiable setting to its original state
  vim.bo.modifiable = modifiable_was_enabled
end

keymap.set("n", "<leader>al", ":colorscheme catppuccin-latte<CR>")
keymap.set("n", "<leader>an", ":colorscheme arctic<CR>")
keymap.set("n", "<leader>ab", "<cmd>lua customizeHighlights()<CR>")
keymap.set("n", "<leader>av", ":colorscheme catppuccin-macchiato<CR>")

keymap.set("n", "<leader>j", "<cmd>execute '%!python -m json.tool' <CR>")

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- personal settings
keymap("n", "Y", "y$", opts)

keymap("n", "<Leader>er", "<CMD>luafile %<CR>", term_opts)
-- deselect matching string after search
keymap("n", "<Leader>.", "<CMD>noh<CR>", opts)
-- replace all instances selected with shift + *
keymap("n", "<Leader>z", ":%s///g<Left><Left>", opts)


-- split window
keymap("n", "<Leader>wh", "<CMD>split<CR>", opts)
keymap("n", "<Leader>wv", "<CMD>vsplit<CR>", opts)

-- save and quite
keymap("n", "<Leader>fs", "<CMD>w<CR>", opts)
keymap("n", "<Leader>q", "<CMD>q<CR>", opts)
keymap("n", "<Leader>qq", "<CMD>q!<CR>", opts)

keymap("n","+","<C-a>",opts)
keymap("n","-","<C-x>",opts)

keymap("n", "<C-a>", "gg<S-v>G",opts)
-- new tab
keymap("n", "te", ":tabedit<Return>",opts)

-- navigate tabs
keymap("n", "tl", ":tabnext<Return>",opts)
keymap("n", "th", ":tabNext<Return>",opts)



keymap("n", "<Leader>rr", "<CMD>luafile %<CR>", opts)



-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)



-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)



-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- comment
-- gcb
-- gcc

---@diagnostic disable: undefined-global
local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })
keymap.set("n", "<C-w>", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<C-x>", ":x<CR>", { desc = "Save and quit" })

-- Select all
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Navigate between splits
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Resize splits
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase split height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease split height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease split width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase split width" })

-- Buffer navigation
keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Tab management
keymap.set("n", "<leader>tn", ":tabnew | Explore<CR>", { desc = "New tab with explorer" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tmh", ":-tabmove<CR>", { desc = "Move tab left" })
keymap.set("n", "<leader>tml", ":+tabmove<CR>", { desc = "Move tab right" })

-- Quick tab navigation (alternative)
keymap.set("n", "<A-l>", ":tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<A-h>", ":tabprevious<CR>", { desc = "Previous tab" })

-- File explorer (netrw)
keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
keymap.set("n", "<leader>E", ":Sexplore<CR>", { desc = "Open explorer in split" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- System clipboard (requires xclip or xsel on Linux, pbcopy on macOS)
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Quickfix list navigation
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })
keymap.set("n", "]q", ":cnext<CR>", { desc = "Next quickfix item" })
keymap.set("n", "[q", ":cprev<CR>", { desc = "Previous quickfix item" })
keymap.set("n", "]Q", ":clast<CR>", { desc = "Last quickfix item" })
keymap.set("n", "[Q", ":cfirst<CR>", { desc = "First quickfix item" })

-- Location list navigation
keymap.set("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
keymap.set("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })
keymap.set("n", "]l", ":lnext<CR>", { desc = "Next location item" })
keymap.set("n", "[l", ":lprev<CR>", { desc = "Previous location item" })
keymap.set("n", "]L", ":llast<CR>", { desc = "Last location item" })
keymap.set("n", "[L", ":lfirst<CR>", { desc = "First location item" })

-- Formatting (configured in plugins/formatter.lua)
-- <leader>fm - Format file or selection (requires stylua installed)

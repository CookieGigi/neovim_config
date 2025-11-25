---@diagnostic disable: undefined-global
-- Leader key (must be set before lazy.nvim loads)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Backspace
vim.opt.backspace = "indent,eol,start"

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Swap & backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Scroll
vim.opt.scrolloff = 8

-- Tab line (always show tabs)
vim.opt.showtabline = 2

-- Favor tabs over buffers
vim.opt.switchbuf = "usetab,newtab" -- Jump to existing tab or create new one

-- Netrw (file explorer) settings
vim.g.netrw_banner = 0 -- Hide banner
vim.g.netrw_liststyle = 0 -- Tree view
vim.g.netrw_browse_split = 3 -- Open files in new tabs
vim.g.netrw_winsize = 25 -- Window size percentage

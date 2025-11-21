---@diagnostic disable: undefined-global
-- Check if Snacks is loaded, fallback to vim.keymap if not
local has_snacks, snacks = pcall(require, "snacks")
local keymap = has_snacks and snacks.keymap or vim.keymap

-- General keymaps
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })
keymap.set("n", "<C-w>", ":qa<CR>", { desc = "Quit all" })
keymap.set("n", "<C-x>", ":x<CR>", { desc = "Save and quit" })

-- Select all
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management (moved from <leader>s to <leader>w for clarity)
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Switch windows" })

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

-- Buffer management (prefer tabs - use <Tab>/<S-Tab> for navigation)
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
keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous tab" })

-- File explorer (netrw)
keymap.set("n", "<leader>e", ":Texplore<CR>", { desc = "Open file explorer in new tab" })
keymap.set("n", "<leader>E", ":Explore<CR>", { desc = "Open file explorer in current window" })

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

-- Diagnostics (not LSP-specific, always available)
keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic" })
keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic" })
keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show diagnostics in location list" })

-- LSP-aware keymaps (automatically set when LSP attaches)
-- Documentation
keymap.set("n", "K", vim.lsp.buf.hover, {
  lsp = { method = "textDocument/hover" },
  desc = "Show hover documentation",
})
keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, {
  lsp = { method = "textDocument/signatureHelp" },
  desc = "Show signature help",
})

-- Code actions
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
  lsp = { method = "textDocument/codeAction" },
  desc = "Code actions",
})
keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
  lsp = { method = "textDocument/rename" },
  desc = "Rename symbol",
})

-- Workspace management
keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {
  lsp = {},
  desc = "Add workspace folder",
})
keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {
  lsp = {},
  desc = "Remove workspace folder",
})
keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {
  lsp = {},
  desc = "List workspace folders",
})

-- Filetype-specific keymaps
-- Lua files
keymap.set("n", "<localleader>r", function()
  vim.cmd.source()
end, {
  ft = "lua",
  desc = "Run Lua File",
})
keymap.set("n", "<localleader>t", function()
  local line = vim.api.nvim_get_current_line()
  local chunk, err = load("return " .. line)
  if chunk then
    local result = chunk()
    print(vim.inspect(result))
  else
    vim.notify("Error loading line: " .. err, vim.log.levels.ERROR)
  end
end, {
  ft = "lua",
  desc = "Run Lua Line",
})
keymap.set("v", "<localleader>t", function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
  local code = table.concat(lines, "\n")
  local chunk, err = load(code)
  if chunk then
    local result = chunk()
    if result then
      print(vim.inspect(result))
    end
  else
    vim.notify("Error loading code: " .. err, vim.log.levels.ERROR)
  end
end, {
  ft = "lua",
  desc = "Run Lua Selection",
})

-- Help files
keymap.set("n", "q", ":q<CR>", {
  ft = "help",
  desc = "Quit help window",
})

-- Quickfix/Location list
keymap.set("n", "q", ":q<CR>", {
  ft = { "qf" },
  desc = "Quit quickfix/location list",
})

-- Markdown files
keymap.set("n", "<localleader>p", function()
  -- Preview markdown with glow in a new tab
  local file = vim.fn.expand("%:p")
  vim.cmd("tabnew")
  vim.cmd("terminal glow " .. vim.fn.shellescape(file))
  vim.cmd("startinsert")
end, {
  ft = "markdown",
  desc = "Preview Markdown (glow)",
})

keymap.set("n", "<localleader>P", function()
  -- Preview markdown with glow in pager mode (fullscreen terminal)
  local file = vim.fn.expand("%:p")
  vim.cmd("terminal glow --pager " .. vim.fn.shellescape(file))
end, {
  ft = "markdown",
  desc = "Preview Markdown (glow pager)",
})

-- Formatting (configured in plugins/formatter.lua)
-- <leader>cf - Format file or selection (requires stylua installed)

-- Testing (configured in plugins/neotest.lua)
-- <leader>tt - Run nearest test
-- <leader>tf - Run current file
-- <leader>ta - Run all tests
-- <leader>td - Debug nearest test
-- <leader>tS - Toggle test summary
-- See plugins/neotest.lua for all test keymaps

-- Netrw rename integration with Snacks LSP rename
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "netrw" },
  group = vim.api.nvim_create_augroup("NetrwOnRename", { clear = true }),
  callback = function()
    vim.keymap.set("n", "R", function()
      local original_file_path = vim.b.netrw_curdir .. "/" .. vim.fn["netrw#Call"]("NetrwGetWord")

      vim.ui.input({ prompt = "Move/rename to:", default = original_file_path }, function(target_file_path)
        if target_file_path and target_file_path ~= "" then
          local file_exists = vim.uv.fs_access(target_file_path, "W")

          if not file_exists then
            vim.uv.fs_rename(original_file_path, target_file_path)

            -- Notify LSP clients about the file rename
            local has_snacks, snacks = pcall(require, "snacks")
            if has_snacks then
              snacks.rename.on_rename_file(original_file_path, target_file_path)
            end
          else
            vim.notify("File '" .. target_file_path .. "' already exists! Skipping...", vim.log.levels.ERROR)
          end

          -- Refresh netrw
          vim.cmd(":Ex " .. vim.b.netrw_curdir)
        end
      end)
    end, { remap = true, buffer = true, desc = "Rename/move file with LSP support" })
  end,
})

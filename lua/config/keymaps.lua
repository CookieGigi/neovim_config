---@diagnostic disable: undefined-global
-- ============================================================================
-- Keymaps Configuration
-- ============================================================================
-- Organized by category with consistent prefixes:
--
-- <leader> Prefix Categories:
--   b = Buffer management
--   c = Code actions (LSP)
--   d = Debug (DAP)
--   f = Find/Files
--   g = Git
--   l = LSP (symbols, etc.)
--   n = Notifications
--   q = Quickfix
--   s = Search
--   t = Test
--   u = UI/Toggles
--   v = Scratch/Variables
--   w = Window
--   y = Yank/Clipboard
--
-- Direct Mappings (no leader):
--   gd, gD, gr, gI, gy = LSP navigation
--   K = Hover documentation
--   [d/]d = Diagnostic navigation
--   [q/]q = Quickfix navigation
--
-- Control Keys:
--   <C-h/j/k/l> = Window navigation
--   <C-s> = Save
--   <C-q> = Quit all
--   <C-a> = Select all
-- ============================================================================

local keymap = vim.keymap.set

-- ============================================================================
-- General Keymaps
-- ============================================================================

-- Save file
keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })

-- Quit
keymap("n", "<C-q>", ":qa<CR>", { desc = "Quit all" })
keymap("n", "<C-x>", ":x<CR>", { desc = "Save and quit" })

-- Select all
keymap("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Better indenting (stay in visual mode)
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move lines
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ============================================================================
-- Buffer Management (<leader>b*)
-- ============================================================================

keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
keymap("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bD", ":bdelete!<CR>", { desc = "Delete buffer (force)" })

-- ============================================================================
-- Tab Navigation
-- ============================================================================

keymap("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })
keymap("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous tab" })

-- ============================================================================
-- Window Management (<leader>w*)
-- ============================================================================

-- Split windows
keymap("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
keymap("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })
keymap("n", "<leader>ww", "<C-w>w", { desc = "Switch windows" })

-- Navigate between splits
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to bottom split" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to top split" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Resize splits
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase split height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease split height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease split width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase split width" })

-- ============================================================================
-- Clipboard/Yank (<leader>y*)
-- ============================================================================

keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- ============================================================================
-- Quickfix List (<leader>q*)
-- ============================================================================

keymap("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
keymap("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })
keymap("n", "<leader>qn", ":cnext<CR>", { desc = "Next quickfix item" })
keymap("n", "<leader>qp", ":cprev<CR>", { desc = "Previous quickfix item" })
keymap("n", "<leader>qf", ":cfirst<CR>", { desc = "First quickfix item" })
keymap("n", "<leader>ql", ":clast<CR>", { desc = "Last quickfix item" })

-- Quick navigation
keymap("n", "]q", ":cnext<CR>", { desc = "Next quickfix item" })
keymap("n", "[q", ":cprev<CR>", { desc = "Previous quickfix item" })
keymap("n", "]Q", ":clast<CR>", { desc = "Last quickfix item" })
keymap("n", "[Q", ":cfirst<CR>", { desc = "First quickfix item" })

-- ============================================================================
-- Location List (<leader>l*)
-- ============================================================================

keymap("n", "<leader>lo", ":lopen<CR>", { desc = "Open location list" })
keymap("n", "<leader>lc", ":lclose<CR>", { desc = "Close location list" })
keymap("n", "<leader>ln", ":lnext<CR>", { desc = "Next location item" })
keymap("n", "<leader>lp", ":lprev<CR>", { desc = "Previous location item" })

-- Quick navigation
keymap("n", "]l", ":lnext<CR>", { desc = "Next location item" })
keymap("n", "[l", ":lprev<CR>", { desc = "Previous location item" })
keymap("n", "]L", ":llast<CR>", { desc = "Last location item" })
keymap("n", "[L", ":lfirst<CR>", { desc = "First location item" })

-- ============================================================================
-- Diagnostics (<leader>d*)
-- ============================================================================

keymap("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show diagnostics in location list" })
keymap("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Show diagnostics in quickfix" })

-- Quick navigation
keymap("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic" })
keymap("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic" })

-- ============================================================================
-- LSP Keymaps (set via autocmd when LSP attaches)
-- ============================================================================

local function setup_lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }
  
  -- Navigation (direct mappings - no leader)
  keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
  keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
  keymap("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Show references" }))
  keymap("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
  keymap("n", "gy", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
  
  -- Documentation
  keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show hover documentation" }))
  keymap("n", "<leader>lh", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Show signature help" }))
  
  -- Code actions (<leader>c*)
  keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
  keymap("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
  keymap("n", "<leader>cf", function()
    require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
  end, vim.tbl_extend("force", opts, { desc = "Format file or selection" }))
  
  -- LSP symbols (<leader>l*)
  keymap("n", "<leader>ls", vim.lsp.buf.document_symbol, vim.tbl_extend("force", opts, { desc = "Document symbols" }))
  keymap("n", "<leader>lS", vim.lsp.buf.workspace_symbol, vim.tbl_extend("force", opts, { desc = "Workspace symbols" }))
  keymap("n", "<leader>li", vim.lsp.buf.incoming_calls, vim.tbl_extend("force", opts, { desc = "Incoming calls" }))
  keymap("n", "<leader>lo", vim.lsp.buf.outgoing_calls, vim.tbl_extend("force", opts, { desc = "Outgoing calls" }))
  
  -- Workspace management (<leader>lw*)
  keymap("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
  keymap("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
  keymap("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))
end

-- Set up LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    setup_lsp_keymaps(args.buf)
  end,
})

-- ============================================================================
-- File Explorer (netrw)
-- ============================================================================

keymap("n", "<leader>e", ":Texplore<CR>", { desc = "Open file explorer in new tab" })
keymap("n", "<leader>E", ":Explore<CR>", { desc = "Open file explorer in current window" })

-- ============================================================================
-- Filetype-specific Keymaps
-- ============================================================================

-- Lua files (<localleader>)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    local opts = { buffer = true, desc = "Run Lua File" }
    keymap("n", "<localleader>r", function()
      vim.cmd.source()
    end, opts)
    
    keymap("n", "<localleader>t", function()
      local line = vim.api.nvim_get_current_line()
      local chunk, err = load("return " .. line)
      if chunk then
        local result = chunk()
        print(vim.inspect(result))
      else
        vim.notify("Error loading line: " .. err, vim.log.levels.ERROR)
      end
    end, { buffer = true, desc = "Run Lua Line" })
    
    keymap("v", "<localleader>t", function()
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
    end, { buffer = true, desc = "Run Lua Selection" })
  end,
})

-- Help files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    keymap("n", "q", ":q<CR>", { buffer = true, desc = "Quit help window" })
  end,
})

-- Quickfix/Location list
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    keymap("n", "q", ":q<CR>", { buffer = true, desc = "Quit quickfix/location list" })
  end,
})

-- Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    keymap("n", "<localleader>p", function()
      local file = vim.fn.expand("%:p")
      vim.cmd("tabnew")
      vim.cmd("terminal glow " .. vim.fn.shellescape(file))
      vim.cmd("startinsert")
    end, { buffer = true, desc = "Preview Markdown (glow)" })
    
    keymap("n", "<localleader>P", function()
      local file = vim.fn.expand("%:p")
      vim.cmd("terminal glow --pager " .. vim.fn.shellescape(file))
    end, { buffer = true, desc = "Preview Markdown (glow pager)" })
  end,
})

-- ============================================================================
-- Netrw LSP Rename Integration
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  group = vim.api.nvim_create_augroup("NetrwOnRename", { clear = true }),
  callback = function()
    keymap("n", "R", function()
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
    end, { buffer = true, desc = "Rename/move file with LSP support" })
  end,
})

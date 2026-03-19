---@diagnostic disable: undefined-global
-- Package.json scripts runner using Snacks picker
-- Provides a picker to select and run npm/pnpm/yarn scripts

local function detect_package_manager()
  local root = vim.fn.getcwd()
  local markers = {
    pnpm = { "pnpm-lock.yaml" },
    yarn = { "yarn.lock" },
    npm = { "package-lock.json" },
  }

  for manager, files in pairs(markers) do
    for _, file in ipairs(files) do
      if vim.fn.filereadable(root .. "/" .. file) == 1 then
        return manager
      end
    end
  end

  return "npm"
end

local function read_package_json()
  local root = vim.fn.getcwd()
  local package_path = root .. "/package.json"

  if vim.fn.filereadable(package_path) == 0 then
    vim.notify("No package.json found in current directory", vim.log.levels.WARN)
    return nil
  end

  local ok, content = pcall(vim.fn.readfile, package_path)
  if not ok or not content then
    vim.notify("Failed to read package.json", vim.log.levels.ERROR)
    return nil
  end

  local json_str = table.concat(content, "\n")
  local ok2, data = pcall(vim.json.decode, json_str)
  if not ok2 or not data then
    vim.notify("Failed to parse package.json", vim.log.levels.ERROR)
    return nil
  end

  return data
end

local function get_scripts_with_descriptions(package_data)
  if not package_data or not package_data.scripts then
    return {}
  end

  local scripts = {}
  for name, command in pairs(package_data.scripts) do
    table.insert(scripts, {
      name = name,
      command = command,
      text = name,
    })
  end

  table.sort(scripts, function(a, b)
    return a.name < b.name
  end)

  return scripts
end

local function run_script(script_name)
  local package_manager = detect_package_manager()
  local cmd = string.format("%s run %s", package_manager, script_name)

  vim.cmd("split term://" .. cmd)
  vim.cmd("startinsert")
end

local function open_scripts_picker()
  local package_data = read_package_json()
  if not package_data then
    return
  end

  local scripts = get_scripts_with_descriptions(package_data)
  if #scripts == 0 then
    vim.notify("No scripts found in package.json", vim.log.levels.WARN)
    return
  end

  local items = {}
  for _, script in ipairs(scripts) do
    table.insert(items, {
      text = script.name,
      name = script.name,
      command = script.command,
      manager = detect_package_manager(),
    })
  end

  require("snacks").picker({
    title = "Package.json Scripts (" .. detect_package_manager() .. ")",
    items = items,
    format = function(item)
      local ret = {}
      ret[#ret + 1] = { item.name, "SnacksPickerLabel" }
      ret[#ret + 1] = { " " .. item.command, "SnacksPickerComment" }
      return ret
    end,
    confirm = function(picker, item)
      picker:close()
      if item then
        run_script(item.name)
      end
    end,
  })
end

return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>r",
      function()
        open_scripts_picker()
      end,
      desc = "Run package.json script",
    },
  },
}

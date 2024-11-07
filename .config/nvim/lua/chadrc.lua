-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "monochrome",
  transparency = false,
  theme_toggle = { "monochrome", "oxocarbon" }
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- ui stuff
M.ui = {
  statusline = {
    theme = "vscode_colored",
    separator_style = "block",
  },
  tabufline = {
    enabled = true,
    lazyload = false,
  },
  cmp = {
    icons_left = false,
    lspkind_text = true,
    style = "default",
  }
}

M.nvdash = {
  load_on_startup = true,
  header = {
    " █▄ █ █▀█ █▄ █ █▀▀ █▀█ █▀▄▀█ █▀█ █   █▀▀ ▀█▀ █▀▀ ",
    " █ ▀█ █▄█ █ ▀█ █▄▄ █▄█ █ ▀ █ █▀▀ █▄▄ ██▄  █  ██▄ ",
    "                                                 ",
    "                                                 "
  },
  buttons = {
    {txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    {txt = "󰈚  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    {txt = "󰈭  Find Word", keys = "Spc f w", cmd =  "Telescope live_grep" },
    {txt = "  Bookmarks", keys = "Spc m a", cmd =  "Telescope marks" },
    {txt = "  Themes", keys = "Spc t h", cmd =  "Telescope themes" },
    {txt = "  Mappings", keys = "Spc c h", cmd =  "NvCheatsheet" },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
        hl = "NvDashLazy",
        no_gap = true,
    },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
  }
}

return M

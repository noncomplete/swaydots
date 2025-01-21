-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "yoru",
	hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Normal = {
      bg = {"black", -9}
    },
    CmpPmenu = {
      bg = {"black", -2}
    },
    --CmpBorder = {
    --  bg = {"black", -1}
    --},
    CmpDoc = {
      bg = {"black", -9}
    },
    CmpDocBorder = {
      bg = {"black", -9}
    },
    CmpSel = {
      bg = "blue"
    },
    PmenuSel = {
      bg = "blue"
    }
  },
  theme_toggle = {"mountain","yoru"}
}

M.ui = {
  telescope = { style = "borderless" },
  cmp = { style = "flat_dark" },
  statusline = { theme = "vscode_colored" },
  tabufline = {enabled = true, lazyload = false, modules = nil},
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                               ",
    "█▄ █ █▀█ █▄ █ █▀▀ █▀█ █▀▄▀█ █▀█ █   █▀▀ ▀█▀ █▀▀",
    "█ ▀█ █▄█ █ ▀█ █▄▄ █▄█ █ ▀ █ █▀▀ █▄▄ ██▄  █  ██▄",
    "                                               ",
    "                                               ",
  },

  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

M.lsp = {signature = true}

M.mason = { pkgs = {}, skip = {} }

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M

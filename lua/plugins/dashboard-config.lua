local vim = vim
local g = vim.g

vim.cmd("packadd dashboard-nvim")

g.dashboard_default_executive = "telescope"

local custom_header = {
  "",
  "                        .",
  "                        y/",
  "                        yo",
  ".--------      --------:yo",
  " :++syy++      sy++yys+++:",
  "    .:.        ss  .:.",
  "               ss",         
  "               ss",               
  "               ss",             
  "    .    ......ss",               
  "   .y+   .+oooooo",              
  "    /y+",
  "     -oyo/:",
  "        -:-",
  "",
  ""
}

g.dashboard_custom_header = custom_header

g.dashboard_custom_section = {
  a = {
    description = { "  Find File                  SPC f f" },
    command = "Telescope find_files",
  },
  b = {
    description = { "  Recents                    SPC f o" },
    command = "Telescope oldfiles",
  },
  e = {
    description = { "洛 New Buffer                 SPC g g" },
    command = "enew",
  },
  f = {
    description = { "  Edit Configuration         SPC d c" },
    command = "e ~/.config/nvim/init.lua",
  },
}

g.dashboard_custom_footer = { "TERKEL.COM" }

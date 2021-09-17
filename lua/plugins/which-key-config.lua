require('which-key').setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = 'Comments' },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  window = {
    border = 'none', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
}

require('which-key').register({
  ['1'] = 'Go to Buffer 1',
  ['2'] = 'Go to Buffer 2',
  ['3'] = 'Go to Buffer 3',
  ['4'] = 'Go to Buffer 4',
  ['5'] = 'Go to Buffer 5',
  ['6'] = 'Go to Buffer 6',
  ['7'] = 'Go to Buffer 7',
  ['8'] = 'Go to Buffer 8',
  ['9'] = 'Go to Buffer 9',
  a = 'Select all',
  b = {
    name = '+Buffer',
    b = 'Show blame for line',
    d = 'Delete a Buffer',
  },
  c = {
    name = '+Code Action',
    a = 'Code Actions',
    c = 'Cursor Diagnostics',
    d = 'Line Diagnostics',
  },
  f = {
    name = '+Search',
    f = 'Find File',
    b = 'Find Buffer',
    g = 'Find changed File',
    h = 'Find Help',
    i = 'Find Text',
    o = 'Find recent File',
    e = 'Find browser (explore)',
    t = 'Find todo',
    a = 'Find code action',
    d = 'Find code definition',
  },
  g = {
    name = '+New Buffer',
    g = 'New Buffer',
  },
  h = 'Trouble',
  l = '+LazyGit',
  n = {
    name = '+Explorer',
    n = 'Explorer',
  },
}, {
  prefix = '<leader>',
})

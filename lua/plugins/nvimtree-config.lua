local vim = vim
local g = vim.g

local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
  return
end

local tree_cb = tree_c.nvim_tree_callback

g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_ignore_ft = { "dashboard" } -- don't open tree on specific fiypes.
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0 -- closes tree when it's the last window
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat({
  ":t:gs?$?/..",
  string.rep(" ", 1000),
  "?:gs?^??",
})
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1
g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 0
g.nvim_tree_update_cwd = 1

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
    -- arrow_open = "",
    -- arrow_closed = "",
    default = "",
    open = "",
    empty = "", -- 
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

g.nvim_tree_bindings = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
  { key = "v", cb = tree_cb("vsplit") },
  { key = "x", cb = tree_cb("split") },
  { key = "<C-t>", cb = tree_cb("tabnew") },
  { key = "H", cb = tree_cb("toggle_dotfiles") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "x", cb = tree_cb("cut") },
  { key = "gc", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "q", cb = tree_cb("close") },
  { key = "?", cb = tree_cb("toggle_help") },
}

-- hide statusline when nvim tree is opened
vim.cmd(
  [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
)

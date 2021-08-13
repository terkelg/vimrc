require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = "  ",
    entry_prefix = "  ",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules", ".git" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
  },
})

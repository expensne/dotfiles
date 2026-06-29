local ignore_file = vim.fn.stdpath("config") .. "/telescope-rg-ignore"

local options = {
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--ignore-file",
        ignore_file,
      },
    },
    live_grep = {
      additional_args = {
        "--hidden",
        "--ignore-file",
        ignore_file,
      },
    },
  },
}

return options

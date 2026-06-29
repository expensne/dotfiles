return {
  strategies = {
    chat = {
      headers = {
        context = "Current file: ${file.name} (${filetype})\n",
      },
    },
  },

  display = {
    chat = {
      show_agent_name = true,
      separator = "─",
      show_context = true,
      show_header_separator = false,
      show_settings = false,
      show_token_count = true,
      show_tools_processing = true,
      start_in_insert_mode = false,
      window = {
        width = 0.3,
      },
    },
  },

  edit = {
    diff = {
      enabled = true,
      algorithm = "patience",
    },
  },

  ask = { use_selection = true },

  chat = {
    save_session = true,
    load_session = true,
  },
}

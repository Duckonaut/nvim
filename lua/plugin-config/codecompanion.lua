require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = "ollama",
      model = "qwen3:b"
    },
    inline = {
      adapter = "ollama",
      model = "qwen3:b"
    },
    cmd = {
      adapter = "ollama",
      model = "qwen3:b"
    },
  },
  opts = {
    log_level = "DEBUG",
  },
})

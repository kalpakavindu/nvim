local M = {}

M.filetypes = {
  templ = ""
}

M.seperators = {
  arrow = {
    section = { left = "", right = "" },
    component = { left = "", right = "" },
  },
  block = {
    section = { left = "█", right = "█" },
    component = { left = "|", right = "|" },
  },
  default = {
    section = { left = "", right = "" },
    component = { left = "", right = "" },
  },
  round = {
    section = { left = "", right = "" },
    component = { left = "", right = "" },
  },
}

return M

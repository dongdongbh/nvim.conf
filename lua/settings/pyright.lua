local lspconfig = require("lspconfig")

local python_root_files = {
  "WORKSPACE", -- For Bazel projects
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
}

return {
  -- root_dir can be a function. lspconfig.util.root_pattern(...) returns a function
  -- that picks the first folder containing any of the given files.
  root_dir = lspconfig.util.root_pattern(unpack(python_root_files)),

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}

require'mind'.setup({
  persistence = {
    data_dir = "~/Documents/notes",
  },
  edit = {
    data_extension=".norg",
    data_header = "* %s",
  }
})

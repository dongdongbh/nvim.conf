require'mind'.setup({
  persistence = {
    data_dir = "~/Documents/notes/work",
    state_path = "~/Documents/notes/work/.mind/mind.json",
  },
  edit = {
    data_extension=".norg",
    data_header = "* %s",
  }
})

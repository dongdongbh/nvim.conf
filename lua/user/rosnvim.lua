local vim_utils = require "ros-nvim.vim-utils"
require 'ros-nvim'.setup {
  -- path to your catkin workspace
  catkin_ws_path = "~/catkin_ws",

  -- make program (e.g. "catkin_make" or "catkin build" )
  catkin_program = "catkin build",

  --method for opening terminal for e.g. catkin_make: `vim_utils.open_new_buffer` or custom function
  open_terminal_method = function()
      vim_utils.open_split()
  end,

  -- terminal height for build / test, only valid with `open_terminal_method=open_split()`
  terminal_height = 8,

  -- Picker mappings in telescope
  node_picker_mappings = function(map)
      map("n", "<c-k>", vim_utils.open_terminal_with_format_cmd_entry("rosnode kill %s"))
      map("i", "<c-k>", vim_utils.open_terminal_with_format_cmd_entry("rosnode kill %s"))
  end,
  topic_picker_mappings = function(map)
      local cycle_previewers = function(prompt_bufnr)
          local picker = action_state.get_current_picker(prompt_bufnr)
          picker:cycle_previewers(1)
      end
      map("n", "<c-b>", vim_utils.open_terminal_with_format_cmd_entry("rostopic pub %s"))
      map("i", "<c-b>", vim_utils.open_terminal_with_format_cmd_entry("rostopic pub %s"))
      -- While browsing topics, press <c-e> to switch between `rostopic info` and `rostopic echo`
      map("n", "<c-e>", cycle_previewers)
      map("i", "<c-e>", cycle_previewers)
  end,
  service_picker_mappings = function(map)
      map("n", "<c-e>", vim_utils.open_terminal_with_format_cmd_entry("rosservice call %s"))
      map("i", "<c-e>", vim_utils.open_terminal_with_format_cmd_entry("rosservice call %s"))
  end,
  param_picker_mappings = function(map)
      map("n", "<c-e>", vim_utils.open_terminal_with_format_cmd_entry("rosparam set %s"))
      map("i", "<c-e>", vim_utils.open_terminal_with_format_cmd_entry("rosparam set %s"))
  end
}


local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<Up>", "<NOP>", opts)
-- Search files in current package
vim.keymap.set("n", "<leader>ftp", "<cmd>lua require('ros-nvim.telescope.package').search_package()<cr>", opts)
-- Live grep in current package
vim.keymap.set("n", "<leader>ftg", "<cmd>lua require('ros-nvim.telescope.package').grep_package()<cr>", opts)

-- #### ROS Introspection ####
-- Topics list & info
vim.keymap.set("n", "<leader>rtl", "<cmd>lua require('ros-nvim.telescope.pickers').topic_picker()<cr>", opts)
-- Nodes list & info
vim.keymap.set("n", "<leader>rnl", "<cmd>lua require('ros-nvim.telescope.pickers').node_picker()<cr>", opts)
-- Services list & info
vim.keymap.set("n", "<leader>rsl", "<cmd>lua require('ros-nvim.telescope.pickers').service_picker()<cr>", opts)
-- Service definitions list & info
vim.keymap.set("n", "<leader>rds", "<cmd>lua require('ros-nvim.telescope.pickers').srv_picker()<cr>", opts)
-- Message definitions list & info
vim.keymap.set("n", "<leader>rdm", "<cmd>lua require('ros-nvim.telescope.pickers').msg_picker()<cr>", opts)
-- Params list & values
vim.keymap.set("n", "<leader>rpl", "<cmd>lua require('ros-nvim.telescope.pickers').param_picker()<cr>", opts)

-- Build entire workspace
vim.keymap.set("n", "<leader>bb", "<cmd>lua require('ros-nvim.build').catkin_make()<cr>", opts)
-- Build current package
vim.keymap.set("n", "<leader>bp", "<cmd>lua require('ros-nvim.build').catkin_make_pkg()<cr>", opts)

-- Execute current rostest
vim.keymap.set("n", "<leader>rt", "<cmd>lua require('ros-nvim.test').rostest()<cr>", opts)


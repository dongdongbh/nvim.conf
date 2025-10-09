local M = {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
}

function M.config()
  require('orgmode').setup({
    org_agenda_files = { '~/Sync/orgfiles/**/*.org' },
    org_agenda_hide_files = {
        '~/Sync/orgfiles/inbox.org',
        '~/Sync/orgfiles/someday.org'
    },
    org_default_notes_file = '~/Sync/orgfiles/inbox.org',
    org_refile_targets = {
      ['~/Sync/orgfiles/tasks.org'] = { level = 1 },
      ['~/Sync/orgfiles/someday.org'] = { level = 1 },
      ['~/Sync/orgfiles/personal.org'] = { level = 1 },
    },
    org_todo_keywords = { 'TODO', 'NEXT', 'PROG', 'INTR', 'DONE' },
    win_split_mode = 'vertical',
  })
  vim.keymap.set('n', '<Leader>ofi', ':e ~/Sync/orgfiles/inbox.org<CR>', {
  desc = 'Org Open Inbox'
})
  vim.keymap.set('n', '<Leader>oft', ':e ~/Sync/orgfiles/tasks.org<CR>', {
  desc = 'Org Open tasks'
})
  vim.keymap.set('n', '<Leader>ofp', ':e ~/Sync/orgfiles/personal.org<CR>', {
  desc = 'Org Open personal'
})
end

return M

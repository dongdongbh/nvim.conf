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
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function(event)
      vim.keymap.set('n', '<Leader>os', function()
        local ok, orgmode = pcall(require, 'orgmode')
        if not ok then
          return
        end

        local files = orgmode.files
        if not files then
          return
        end

        local headline = files:get_closest_headline()
        if not headline then
          vim.notify('No Org headline under cursor', vim.log.levels.WARN, { title = 'orgmode' })
          return
        end

        local todo_keywords = headline.file and headline.file:get_todo_keywords()
        if not todo_keywords then
          vim.notify('No TODO keywords configured for this file', vim.log.levels.WARN, { title = 'orgmode' })
          return
        end

        local target = todo_keywords:first_by_type('DONE')
        if not target then
          vim.notify('No DONE state configured for this file', vim.log.levels.WARN, { title = 'orgmode' })
          return
        end

        if headline:get_todo() == target.value then
          return
        end

        local old_state = headline:get_todo()
        local was_done = headline:is_done()

        headline:set_todo(target.value)
        headline = files:get_closest_headline()

        local EventManager = require('orgmode.events')
        EventManager.dispatch(EventManager.event.TodoChanged:new(headline, old_state, was_done))
      end, { desc = 'Org Set to DONE', buffer = event.buf })
    end,
  })
end

return M

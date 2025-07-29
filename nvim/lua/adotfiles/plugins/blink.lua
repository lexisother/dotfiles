---@type LazySpec
return {
  'blink.cmp',
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ['<Tab>'] = {
        'select_next',
        'fallback',
      },

      ['<S-Tab>'] = {
        'select_prev',
        'fallback',
      },
    },
  },
}

-- Color scheme

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    on_colors = function (colors)
      local util = require('tokyonight.util')
      colors.gitSigns = {
        add = colors.teal,
        change = colors.purple,
        delete = colors.red,
      }
    end,
    on_highlights = function(hl, c)
      local util = require('tokyonight.util')
      local prompt = "#2d3149"

      hl.BufferlineInactive = {
        bg = c.bg_dark,
      }
      hl.BufferlineActiveSeparator = {
        bg = c.bg,
        fg = util.darken(c.bg_dark, 0.85, '#000000'),
      }
      hl.BufferlineInactiveSeparator = {
        bg = c.bg_dark,
        fg = util.darken(c.bg_dark, 0.85, '#000000'),
      }

      hl.NeoTreeFileNameOpened = {
        fg = c.orange,
      }

      hl.GitSignsCurrentLineBlame = {
        fg = c.fg_gutter,
      }

      hl.StatusLine = {
        bg = util.darken(c.bg_dark, 0.98, '#000000'),
        fg = c.fg_dark,
      }
      hl.StatusLineComment = {
        bg = util.darken(c.bg_dark, 0.85, '#000000'),
        fg = c.comment,
      }

      hl.LineNrAbove = {
        fg = c.fg_gutter,
      }
      hl.LineNr = {
        fg = util.lighten(c.fg_gutter, 0.7),
      }
      hl.LineNrBelow = {
        fg = c.fg_gutter,
      }

      hl.MsgArea = {
        bg = util.darken(c.bg_dark, 0.85, '#000000'),
      }

      -- Spelling
      hl.spellbad = {
        undercurl = true,
        sp = '#7f3a43',
      }

     -- Copilot
      hl.CopilotSuggestion = {
        fg = c.comment,
      }
    end,
  },
  config = function (plugin, opts)
    require('tokyonight').setup(opts)

    vim.cmd[[
      colorscheme tokyonight
    ]]
  end,
}

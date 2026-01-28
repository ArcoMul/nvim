return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      sources = {
        -- Show hidden files in file picker
        files = { hidden = true },
        -- Show hidden files in explorer
        explorer = { hidden = true },
      },
    },
  },
  keys = {
    -- Open explorer, or focus explorer when already open
    {
      "<leader>e",
      function()
        if Snacks.picker.get({ source = "explorer" })[1] == nil then
          Snacks.picker.explorer()
        elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == true then
          Snacks.picker.explorer()
        elseif Snacks.picker.get({ source = "explorer" })[1]:is_focused() == false then
          Snacks.picker.get({ source = "explorer" })[1]:focus()
        end
      end,
      desc = "Explorer",
    },
  },
}

return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    ...,
    "olimorris/neotest-phpunit",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-phpunit")
      },
    })
  end
}

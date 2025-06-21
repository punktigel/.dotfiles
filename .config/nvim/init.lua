-- load user path
require("user")


-- --------------------------------------------------
-- set your colorscheme
-- --------------------------------------------------
ColorschemeList = { 'rose-pine-dawn', 'rose-pine-moon' }
ColorschemeIndex = 1

vim.cmd('colorscheme ' .. ColorschemeList[ColorschemeIndex])


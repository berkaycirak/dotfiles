local function map(m, k, v)
  vim.keymap.set(m, k, v, { noremap = true, silent = true })
end
map("n", "<F5>", ":resize +2<CR>")
map("n", "<A-t>", '<CMD>lua require("FTerm").toggle()<CR>')

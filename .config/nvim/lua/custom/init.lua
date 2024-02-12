vim.opt.colorcolumn = "120"
vim.opt.spell = true
vim.opt.list = true
vim.opt.encoding = "utf-8"
vim.opt.showbreak = "↪"
vim.opt.listchars = {
  space = '·',
  nbsp = '␣',
  trail = '~',
  eol = '↪',
  tab = '>-',
  precedes = '<',
  extends = '>'
}

vim.o.updatetime = 250
vim.diagnostic.config({
  virtual_text = false
})

vim.wo.relativenumber = true

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

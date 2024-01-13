local status_ok, sp = pcall(require, "spectre")
if not status_ok then
  return
end
sp.setup({
  highlight = {
    ui = "String",
    search = "DiffAdd",
    replace = "DiffDelete"
  },
})

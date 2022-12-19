local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
local status, _ = pcall(vim.cmd, "TransparentEnable")
if not status then
  return
end

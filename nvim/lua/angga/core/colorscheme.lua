-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-moon")
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme moonfly")
-- local status, _ = pcall(vim.cmd, "colorscheme oxocarbon")
if not status then
	return
end

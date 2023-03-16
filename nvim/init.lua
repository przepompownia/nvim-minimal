local configDir = vim.fn.expand('<sfile>:p:h:h')

vim.env['XDG_CONFIG_HOME'] = configDir
vim.env['XDG_DATA_HOME'] = configDir .. '/.xdg/data'
vim.env['XDG_STATE_HOME'] = configDir .. '/.xdg/state'
vim.env['XDG_CACHE_HOME'] = configDir .. '/.xdg/cache'
local stdPathConfig = vim.fn.stdpath('config')

vim.opt.runtimepath:prepend(stdPathConfig)
vim.opt.packpath:prepend(stdPathConfig)
vim.opt.runtimepath:append(stdPathConfig .. '/after')

vim.g.pluginDirs = {
  vim.fn.expand(stdPathConfig .. '/pack/unmerged/opt'),
  vim.fn.expand(stdPathConfig .. '/pack/bundle/opt'),
  vim.fn.expand(stdPathConfig .. '/pack/colorscheme/opt'),
  vim.fn.expand(stdPathConfig .. '/pack/arctgx/opt'),
}
vim.g.initialVimDirectory = stdPathConfig

local extensions = {
  -- {name = 'plenary.nvim'},
}

for _, config in ipairs(extensions) do
  local bang = true
  if config.bang ~= nil then
    bang = config.bang
  end
  local ok, error = pcall(vim.cmd.packadd, {
    args = {config.name},
    bang = bang,
  })
  if not ok then
    vim.api.nvim_create_autocmd('UIEnter', {
      once = true,
      callback = function()
        vim.notify(error, vim.log.levels.ERROR)
      end,
    })
  end
end

local initPerHost = vim.g.initialVimDirectory .. '/initPerHost.lua'
if vim.fn.filereadable(initPerHost) == 1 then
  dofile(initPerHost)
end

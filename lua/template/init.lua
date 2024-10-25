
local tpl_manager = require('template.template_manager')
local command = vim.api.nvim_create_user_command

local M = {}

command('TemplateOpen',function(opts) tpl_manager.tpl_open(opts.args) end, { nargs = 1 })
command('TemplateAdd',function(opts) tpl_manager.tpl_add(opts.args) end, { nargs = 1 })
command('TemplateDelete', function(opts) tpl_manager.tpl_del(opts.args) end, { nargs = 1 })
command('TemplateInsert', function(opts) tpl_manager.tpl_insert(opts.args) end, { nargs = 1 })

function M.setup()

end

return M


local tpl_manager= require('template_manager')

local command = vim.api.nvim_create_user_command

command('TemplateOpen',function(opts) tpl_manager.tpl_open(opts.args) end, { nargs = 1})
command('TemplateAdd',function(opts) tpl_manager.tpl_add(opts.args) end, { nargs = 1})
command('TemplateDelate',function(opts) tpl_manager.tpl_del(opts.args) end, { nargs = 1})

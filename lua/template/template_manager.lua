local tpl_dir = vim.fn.expand("~/templates/")
local tpl_ext = ".tpl"

local M = {}

M.tpl_open = function(tpl_name)
    local file_path = tpl_dir .. "/" .. tpl_name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        vim.cmd("vsplit " .. file_path)
    else
        print("Template '" .. tpl_name .. "' not found.")
    end
end

M.tpl_add = function(tpl_name)
    local file_path = tpl_dir .. "/" .. tpl_name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        print("Template '" .. tpl_name .. "' already exists.")
    else
        vim.fn.writefile({}, file_path)
        print("Template '" .. tpl_name .. "' created.")
    end
    vim.cmd("vsplit " .. file_path)
end

M.tpl_del = function(tpl_name)
    local file_path = tpl_dir .. "/" .. tpl_name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        vim.fn.delete(file_path)
        print("Template '" .. tpl_name .. "' deleted.")
    else
        print("Template '" .. tpl_name .. "' not found.")
    end
end

return M

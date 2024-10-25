local tpl_dir = vim.fn.expand("C:/Users/doter/templates/")
local tpl_ext = ".tpl"

local M = {}

M.tpl_open = function(name)
    local file_path = tpl_dir .. name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        vim.cmd("vsplit " .. file_path)
    else
        print("Template '" .. name .. "' not found.")
    end
end

M.tpl_add = function(name)
    local file_path = tpl_dir .. name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        print("Template '" .. name .. "' already exists.")
    else
        vim.fn.mkdir(tpl_dir, "p")
        print("Template '" .. name .. "' created.")
    end
    vim.cmd("vsplit " .. file_path)
end

M.tpl_del = function(name)
    local file_path = tpl_dir .. name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        vim.fn.delete(file_path)
        print("Template '" .. name .. "' deleted.")
    else
        print("Template '" .. name .. "' not found.")
    end
end

M.tpl_insert = function(name)
    local file_path = tpl_dir .. name .. tpl_ext
    if vim.fn.filereadable(file_path) == 1 then
        local content = vim.fn.readfile(file_path)
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.api.nvim_buf_set_lines(0, cursor_pos[1], cursor_pos[1], false, content)
        vim.api.nvim_win_set_cursor(0, {cursor_pos[1] + #content, 0})
    else
        print("Template '" .. name .. "' not found.")
    end
end

return M

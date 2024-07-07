function doc()
    local function trim(s)
        return s:match( "^%s*(.-)%s*$" )
    end


    local function get_visual_selection()
      local s_start = vim.fn.getpos("v")
      local s_end = vim.fn.getpos(".")
      local n_lines = math.abs(s_end[2] - s_start[2]) + 1
      local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
      local result = table.concat(lines, '')
      return result
    end

    local function split_parameters(param_str)
        local result = {}
        local start = 1
        local depth = 0
        for i = 1, #param_str do
            local c = param_str:sub(i, i)
            if c == ',' and depth == 0 then
                table.insert(result, param_str:sub(start, i - 1))
                start = i + 1
            elseif c == '(' or c == '[' or c == '{' then
                depth = depth + 1
            elseif c == ')' or c == ']' or c == '}' then
                depth = depth - 1
            end
        end
        table.insert(result, param_str:sub(start))
        return result
    end

    local doc_sign = '"""'
    local line = get_visual_selection()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]

    local lines = {}
    table.insert(lines, doc_sign)
    table.insert(lines, '')
    table.insert(lines, 'Parameters')
    table.insert(lines, '----------')


    local parameters = line:gmatch('%b()')()
    if parameters ~= nil or s == '' then
        parameters = string.sub(parameters, 2, -2)
    else
        parameters = ''
    end

    -- for match in parameters:gmatch("([^,]+)") do
    for _, match in ipairs(split_parameters(parameters)) do
        local pair = trim(match)
        local matching = pair:gmatch("([^:]+)")
        local entry = matching()
        if entry ~= nil then
            entry = trim(entry)
            if entry ~= 'self' then
                local type = matching()
                if type ~= nil then
                    type = trim(type)
                    temptype = type:match('^%s*(.-) =')
                    print(temptype)
                    if temptype ~= nil then
                        type = temptype
                    end

                    entry = entry .. ' : ' .. type
                end
                table.insert(lines, entry)
                table.insert(lines, '')
            end
        end
    end


    local return_type = line:match('->%s*(.-)%s*:')
    if return_type ~= nil and return_type ~= 'None' then
        table.insert(lines, 'Returns')
        table.insert(lines, '-------')
        table.insert(lines, return_type)
        table.insert(lines, '')
    end
    table.insert(lines, doc_sign)

    local indent = line:match('^%s*') .. string.rep(' ', vim.opt.tabstop:get())
    local indented_lines = {}
    for _, value in pairs(lines) do
        local new_line = value
        if value ~= '' then
            new_line = indent .. new_line
        end
        table.insert(indented_lines, new_line)
    end

    vim.api.nvim_buf_set_lines(0, row, row, false, indented_lines)
    -- vim.api.nvim_buf_set_lines(0, row, row, false, { get_visual_selection() })
    -- def integrate(chat: Chat, questions: Union[str, int] = None, a: int) -> Union[kek, str]:
end

vim.keymap.set('v', '<leader>ds', doc, { noremap = true })

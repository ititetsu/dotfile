local function generate_c_docstring()
  local line = vim.api.nvim_get_current_line()
  local func_name = line:match("([%w_]+)%s*%(")
  local params = line:match("%((.*)%)")
  local return_type = line:match("^(.-)%s+[%w_]+%s*%(")

  if not func_name or not params then
    print("関数定義が見つかりません")
    return
  end

  local doc_lines = {}
  table.insert(doc_lines, "/**")
  table.insert(doc_lines, " * " .. func_name .. " - 関数の説明を書く")
  table.insert(doc_lines, " *")

  for param in params:gmatch("([^,%s]+%s+[%w_]+)") do
    local name = param:match("([%w_]+)$")
    table.insert(doc_lines, " * @param " .. name .. " 説明を書く")
  end

  if return_type and return_type ~= "void" then
    table.insert(doc_lines, " * @return 戻り値の説明を書く")
  end

  table.insert(doc_lines, " */")

  -- 現在の行の上に挿入
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, doc_lines)
end

vim.api.nvim_create_user_command("GenCDoc", generate_c_docstring, {})

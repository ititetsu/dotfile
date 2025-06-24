local map = vim.api.nvim_set_keymap

-- insert window
map("i", "jj", "<esc><cmd>w<CR>", {})
map("i", "kk", "<esc><cmd>w<CR>", {})

-- move window
map('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })
map('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })
map('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })
map('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })

-- split window
map('n', '<Leader>s', ':<C-u>sp\n', { noremap = true })
map('n', '<Leader>v', ':<C-u>vs\n', { noremap = true })

-- close window
map('n', '<Leader>w', ':<C-u>w\n', { noremap = true })
map('n', '<Leader>q', ':<C-u>q\n', { noremap = true })
map('n', '<Leader>wq', ':<C-u>wq\n', { noremap = true })

-- insert mode move
map('i', '<C-k>', '<Up>', {})
map('i', '<C-j>', '<Down>', {})
map('i', '<C-h>', '<Left>', {})
map('i', '<C-l>', '<Right>', {})

-- rebind embeded command
map('n', '<C-c>', 'gcc', { noremap = false })
map('v', '<C-c>', 'gc', { noremap = false })

-- 定義へジャンプ
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
-- 定義をホバーで表示（ジャンプせずにプレビュー）
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
-- 定義を分割ウィンドウで開く
vim.keymap.set("n", "<leader>gd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition in split" })

vim.keymap.set("n", "<leader>2", vim.lsp.buf.rename, {desc = "rename"})

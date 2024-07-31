vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>tB", ":Git blame<CR>");
vim.keymap.set("n", "<leader>gc", ':Git commit --signoff -m ""<Left>');
vim.keymap.set("n", "<leader>ge", ':Git fetch<CR>');
vim.keymap.set("n", "<leader>gr", ':Git rebase -i origin/main');
vim.keymap.set("n", "<leader>gl", ':Git log<CR>');

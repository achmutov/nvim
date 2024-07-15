vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>tB", ":Git blame<CR>");
vim.keymap.set("n", "<leader>gc", ':!git commit --signoff -m ""<Left>');

require('render-markdown').setup {}
require('avante_lib').load()
require('avante').setup {
    provider = "openai",
    auto_suggestions_provider = "claude",
    tokenizer = "tiktoken",
    openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4.5-preview",
        timeout = 60000,
        temperature = 0,
        max_tokens = 8192,
    },
    behaviour = {
        auto_focus_sidebar = true,
        auto_suggenstions = false,
        auto_suggenstions_respect_ignore = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = true,
        jump_result_buffer_on_finish = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        enable_token_counting = true,
    },
    history = {
        max_tokens = 8192,
        storage_path = vim.fn.stdpath("state") .. "/avante",
        paste = {
            extension = "png",
            filename = "pasted-%Y-%m-%d-%H-%M-%S",
        },
    },
    highlights = {
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    mappings = {
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        focus = "<leader>af",
        toggle = {
            default = "<leader>at",
            debug = "<leader>ad",
            hint = "<leader>ah",
            suggestion = "<leader>as",
            repomap = "<leader>aR",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
            remove_file = "d",
            add_file = "@",
            close = { "<Esc>", "q" },
        },
        files = {
            add_current = "<leader>ac",
        },
    },
    windows = {
        position = "right",
        wrap = true,
        width = 30,
        height = 30,
        sidebar_header = {
            enabled = true,
            align = "center",
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8,
        },
        edit = {
            border = "rounded",
            start_insert = true,
        },
        ask = {
            floating = false,
            border = "rounded",
            start_insert = true,
            focus_on_apply = "ours",
        },
    },
    diff = {
        autojump = true,
        override_timeoutlen = 500,
    },
    hints = {
        enabled = true,
    },
    file_selector = {
        provider = "telescope",
        provider_opts = {},
    },
    suggestion = {
        debounce = 600,
        throttle = 600,
    },
}

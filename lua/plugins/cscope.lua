return {
  "dhananjaylatkar/cscope_maps.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
    "ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
    "echasnovski/mini.pick", -- optional [for picker="mini-pick"]
    "folke/snacks.nvim", -- optional [for picker="snacks"]
  },
  opts = {
    -- USE EMPTY FOR DEFAULT OPTIONS
    -- DEFAULTS ARE LISTED BELOW


    prefix = "<C-\\>", -- prefix to trigger maps

    -- maps related defaults
    disable_maps = false, -- "true" disables default keymaps
    skip_input_prompt = true, -- "true" doesn't ask for input

    -- cscope related defaults
    cscope = {
        -- location of cscope db file
        db_file = "./cscope.out", -- DB or table of DBs
                                -- NOTE:
                                --   when table of DBs is provided -
                                --   first DB is "primary" and others are "secondary"
                                --   primary DB is used for build and project_rooter
        -- cscope executable
        exec = "cscope", -- "cscope" or "gtags-cscope"
        -- choose your fav picker
        picker = "telescope", -- "quickfix", "location", "telescope", "fzf-lua", "mini-pick" or "snacks"
        -- qf_window_size = 5, -- deprecated, replaced by picket_opts below, but still supported for backward compatibility
        -- qf_window_pos = "bottom", -- deprecated, replaced by picket_opts below, but still supported for backward compatibility
        picker_opts = {
        window_size = 5, -- any positive integer
        window_pos = "top", -- "bottom", "right", "left" or "top"
        },
        -- "true" does not open picker for single result, just JUMP
        skip_picker_for_single_result = false, -- "false" or "true"
        -- custom script can be used for db build
        db_build_cmd = { script = "default", args = { "-bqkv" } },
        -- statusline indicator, default is cscope executable
        statusline_indicator = nil,
        -- try to locate db_file in parent dir(s)
        project_rooter = {
        enable = false, -- "true" or "false"
        -- change cwd to where db_file is located
        change_cwd = false, -- "true" or "false"
        },
    },

    -- stack view defaults
    stack_view = {
        tree_hl = true, -- toggle tree highlighting
    },
  },
}

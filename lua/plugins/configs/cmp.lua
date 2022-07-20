-- Define namespace
local fn = vim.fn

-- Initialize cmp
local cmp_presence, cmp = pcall(require, "cmp")

-- Check presence
if not cmp_presence then
    return
end

-- Initialize luasnip
local snip_presence, luasnip = pcall(require, "luasnip")

-- Check presence
if not snip_presence then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Completion settings
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" }
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(_, vim_item)
            local icons = {
                Namespace = "",
                Text = " ",
                Method = " ",
                Function = " ",
                Constructor = " ",
                Field = "ﰠ ",
                Variable = " ",
                Class = "ﴯ ",
                Interface = " ",
                Module = " ",
                Property = "ﰠ ",
                Unit = "塞 ",
                Value = " ",
                Enum = " ",
                Keyword = " ",
                Snippet = " ",
                Color = " ",
                File = " ",
                Reference = " ",
                Folder = " ",
                EnumMember = " ",
                Constant = " ",
                Struct = "פּ ",
                Event = " ",
                Operator = " ",
                TypeParameter = " ",
                Table = "",
                Object = " ",
                Tag = "",
                Array = "[]",
                Boolean = " ",
                Number = " ",
                Null = "ﳠ",
                String = " ",
                Calendar = "",
                Watch = " ",
                Package = "",
            }
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            return vim_item
        end,
    },
    experimental = {
        ghost_text = true
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    })
})

local present, alpha = pcall(require, "alpha")

if not present then
    return
end

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "AlphaButtons"
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts
    }
end

local options = {}

local ascii = {
    [[            :h-                                  Nhy`               ]],
    [[           -mh.                           h.    `Ndho               ]],
    [[           hmh+                          oNm.   oNdhh               ]],
    [[          `Nmhd`                        /NNmd  /NNhhd               ]],
    [[          -NNhhy                      `hMNmmm`+NNdhhh               ]],
    [[          .NNmhhs              ```....`..-:/./mNdhhh+               ]],
    [[           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ]],
    [[           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ]],
    [[      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ]],
    [[ .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ]],
    [[ h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ]],
    [[ hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ]],
    [[ /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ]],
    [[  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ]],
    [[   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ]],
    [[     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ]],
    [[       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ]],
    [[       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ]],
    [[       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ]],
    [[       //+++//++++++////+++///::--                 .::::-------::   ]],
    [[       :/++++///////////++++//////.                -:/:----::../-   ]],
    [[       -/++++//++///+//////////////               .::::---:::-.+`   ]],
    [[       `////////////////////////////:.            --::-----...-/    ]],
    [[        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ]],
    [[         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ]],
    [[           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ]],
    [[            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``]],
    [[           s-`::--:::------:////----:---.-:::...-.....`./:          ]],
    [[          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ]],
    [[         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ]],
    [[        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ]],
    [[                        .-:mNdhh:.......--::::-`                    ]],
    [[                           yNh/..------..`                          ]],
}

options.header = {
    type = "text",
    val = ascii,
    opts = {
        position = "center",
        hl = "AlphaHeader"
    },
}

options.buttons = {
    type = "group",
    val = {
        button("SPC f n", "  New file", ":ene <BAR> startinsert <CR>"),
        button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
        button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
        button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
        button("SPC w q", "  Quit", ":qa<CR>")
    },
    opts = {
        spacing = 1
    },
}

alpha.setup {
    layout = {
        { type = "padding", val = 3 },
        options.header,
        { type = "padding", val = 3 },
        options.buttons
    },
    opts = {},
}


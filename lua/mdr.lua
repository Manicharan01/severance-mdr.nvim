-- severance_mdr.lua
-- Severance MDR Theme for Neovim
-- Inspired by the MDR department from the Apple TV+ show

local M = {}

M.palette = {
    bg = "#1e2324",
    bg_dark = "#161a1b",
    bg_light = "#2d3436",
    fg = "#dfe6e9",
    fg_dark = "#b2bec3",
    teal = "#009485",       -- Main MDR terminal color
    teal_light = "#81ecec", -- Lighter teal for highlights
    teal_dark = "#006d63",  -- Darker teal
    green = "#00b894",      -- Success color
    red = "#d63031",        -- Error color
    yellow = "#fdcb6e",     -- Warning color
    blue = "#0984e3",       -- Info color
    purple = "#6c5ce7",     -- Special elements
    gray = "#636e72",       -- Comments
    white = "#f5f5f5",      -- Bright text
    black = "#0d1112",      -- Deep dark elements
}

M.get_colors = function()
    ---@class MDRColors
    ---`mdr.nvim` colors according vim background
    local base_colors = {
        bg = M.palette.bg,
        bg_dark = M.palette.bg_dark,
        bg_light = M.palette.bg_light,
        fg = M.palette.fg,
        fg_dark = M.palette.fg_dark,
        teal = M.palette.teal,
        teal_light = M.palette.teal_light,
        teal_dark = M.palette.teal_dark,
        green = M.palette.green,
        red = M.palette.red,
        yellow = M.palette.yellow,
        blue = M.palette.blue,
        purple = M.palette.purple,
        aqua = M.palette.aqua,
        orange = M.palette.orange,
        black = M.palette.black,
        white = M.palette.white,
        gray = M.palette.gray,
        none = 'NONE',
    }

    return base_colors
end

---Define MDR highlight groups in neovim.
local set_hlgroups = function()
    local colors = M.get_colors()
    local groups = {
        normal = {
            a = { fg = colors.bg, bg = colors.teal, gui = "bold" },
            b = { fg = colors.white, bg = colors.bg_light },
            c = { fg = colors.fg_dark, bg = colors.bg }
        },
        insert = {
            a = { fg = colors.bg, bg = colors.green, gui = "bold" },
            b = { fg = colors.white, bg = colors.bg_light },
            c = { fg = colors.fg_dark, bg = colors.bg }
        },
        visual = {
            a = { fg = colors.bg, bg = colors.teal_light, gui = "bold" },
            b = { fg = colors.white, bg = colors.bg_light },
            c = { fg = colors.fg_dark, bg = colors.bg }
        },
        replace = {
            a = { fg = colors.bg, bg = colors.red, gui = "bold" },
            b = { fg = colors.white, bg = colors.bg_light },
            c = { fg = colors.fg_dark, bg = colors.bg }
        },
        command = {
            a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
            b = { fg = colors.white, bg = colors.bg_light },
            c = { fg = colors.fg_dark, bg = colors.bg }
        },
        inactive = {
            a = { fg = colors.fg_dark, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg_dark, bg = colors.bg },
            c = { fg = colors.fg_dark, bg = colors.bg }
        },
        colors = colors,
        hightlights = function()
            return {
                Normal = { fg = colors.fg, bg = colors.bg },
                NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
                FloatBorder = { fg = colors.teal, bg = colors.bg_dark },

                StatusLine = { fg = colors.fg, bg = colors.bg_light },
                StatusLineNC = { fg = colors.fg_dark, bg = colors.bg },
                VertSplit = { fg = colors.bg_light, bg = colors.bg },

                -- Line numbers and cursor
                CursorLine = { bg = colors.bg_light },
                CursorLineNr = { fg = colors.teal, bold = true },
                LineNr = { fg = colors.gray },

                -- Search and selection
                Search = { fg = colors.bg, bg = colors.teal_light },
                IncSearch = { fg = colors.bg, bg = colors.teal },
                Visual = { bg = colors.bg_light },
                VisualNOS = { bg = colors.bg_light },

                -- Tabs and pmenu
                TabLine = { fg = colors.fg_dark, bg = colors.bg },
                TabLineFill = { fg = colors.fg, bg = colors.bg_dark },
                TabLineSel = { fg = colors.fg, bg = colors.bg_light },

                Pmenu = { fg = colors.fg, bg = colors.bg_dark },
                PmenuSel = { fg = colors.bg, bg = colors.teal },
                PmenuSbar = { bg = colors.bg_light },
                PmenuThumb = { bg = colors.teal },

                -- Messages and errors
                Error = { fg = colors.red },
                ErrorMsg = { fg = colors.red },
                WarningMsg = { fg = colors.yellow },

                -- Folds
                Folded = { fg = colors.fg_dark, bg = colors.bg_dark },
                FoldColumn = { fg = colors.gray },

                -- Diff
                DiffAdd = { fg = colors.green, bg = colors.bg_dark },
                DiffChange = { fg = colors.yellow, bg = colors.bg_dark },
                DiffDelete = { fg = colors.red, bg = colors.bg_dark },
                DiffText = { fg = colors.fg, bg = colors.bg_light },

                -- Syntax highlighting
                Comment = { fg = colors.gray, italic = true },

                Constant = { fg = colors.teal_light },
                String = { fg = colors.green },
                Character = { fg = colors.green },
                Number = { fg = colors.yellow },
                Boolean = { fg = colors.yellow },
                Float = { fg = colors.yellow },

                Identifier = { fg = colors.fg },
                Function = { fg = colors.blue },

                Statement = { fg = colors.teal },
                Conditional = { fg = colors.teal },
                Repeat = { fg = colors.teal },
                Label = { fg = colors.teal },
                Operator = { fg = colors.teal_light },
                Keyword = { fg = colors.teal, bold = true },
                Exception = { fg = colors.red },

                PreProc = { fg = colors.teal_light },
                Include = { fg = colors.teal_light },
                Define = { fg = colors.teal_light },
                Macro = { fg = colors.teal_light },
                PreCondit = { fg = colors.teal_light },

                Type = { fg = colors.blue },
                StorageClass = { fg = colors.blue },
                Structure = { fg = colors.blue },
                Typedef = { fg = colors.blue },

                Special = { fg = colors.purple },
                SpecialChar = { fg = colors.purple },
                Tag = { fg = colors.teal },
                Delimiter = { fg = colors.fg_dark },
                SpecialComment = { fg = colors.gray, bold = true },
                Debug = { fg = colors.red },

                Underlined = { underline = true },
                Bold = { bold = true },
                Italic = { italic = true },

                -- LSP and Diagnostic
                DiagnosticError = { fg = colors.red },
                DiagnosticWarn = { fg = colors.yellow },
                DiagnosticInfo = { fg = colors.blue },
                DiagnosticHint = { fg = colors.teal_light },

                DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
                DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
                DiagnosticUnderlineInfo = { sp = colors.blue, undercurl = true },
                DiagnosticUnderlineHint = { sp = colors.teal_light, undercurl = true },

                -- Tree-sitter integration
                ["@variable"] = { fg = colors.fg },
                ["@parameter"] = { fg = colors.fg, italic = true },
                ["@function"] = { fg = colors.blue },
                ["@method"] = { fg = colors.blue },
                ["@field"] = { fg = colors.fg },
                ["@property"] = { fg = colors.fg },
                ["@constructor"] = { fg = colors.blue },

                ["@conditional"] = { fg = colors.teal },
                ["@repeat"] = { fg = colors.teal },
                ["@label"] = { fg = colors.teal },
                ["@keyword"] = { fg = colors.teal, bold = true },
                ["@exception"] = { fg = colors.red },
                ["@operator"] = { fg = colors.teal_light },

                ["@type"] = { fg = colors.blue },
                ["@type.builtin"] = { fg = colors.blue, italic = true },
                ["@structure"] = { fg = colors.blue },

                ["@constant"] = { fg = colors.teal_light },
                ["@constant.builtin"] = { fg = colors.teal_light, bold = true },
                ["@constant.macro"] = { fg = colors.teal_light },

                ["@string"] = { fg = colors.green },
                ["@string.escape"] = { fg = colors.purple },
                ["@string.special"] = { fg = colors.purple },

                ["@character"] = { fg = colors.green },
                ["@character.special"] = { fg = colors.purple },

                ["@number"] = { fg = colors.yellow },
                ["@boolean"] = { fg = colors.yellow },
                ["@float"] = { fg = colors.yellow },

                ["@comment"] = { fg = colors.gray, italic = true },
                ["@punctuation"] = { fg = colors.fg_dark },

                ["@tag"] = { fg = colors.teal },
                ["@tag.attribute"] = { fg = colors.blue },
                ["@tag.delimiter"] = { fg = colors.fg_dark },

                -- Git integration
                GitSignsAdd = { fg = colors.green },
                GitSignsChange = { fg = colors.yellow },
                GitSignsDelete = { fg = colors.red },

                -- NvimTree
                NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
                NvimTreeRootFolder = { fg = colors.teal, bold = true },
                NvimTreeFolderName = { fg = colors.teal },
                NvimTreeFolderIcon = { fg = colors.teal },
                NvimTreeOpenedFolderName = { fg = colors.teal_light },
                NvimTreeEmptyFolderName = { fg = colors.gray },
                NvimTreeFileIcon = { fg = colors.fg },
                NvimTreeFileDeleted = { fg = colors.red },
                NvimTreeFileRenamed = { fg = colors.yellow },
                NvimTreeFileDirty = { fg = colors.yellow },
                NvimTreeFileNew = { fg = colors.green },
                NvimTreeGitDirty = { fg = colors.yellow },
                NvimTreeGitStaged = { fg = colors.green },
                NvimTreeGitNew = { fg = colors.green },
                NvimTreeGitDeleted = { fg = colors.red },
                NvimTreeGitRenamed = { fg = colors.yellow },
                NvimTreeSymlink = { fg = colors.blue },
                NvimTreeImageFile = { fg = colors.purple },
            }
        end
    }

    return groups
end

M.setup = function(user_config)
    local colors = set_hlgroups().colors
    local highlights = set_hlgroups().hightlights()

    vim.cmd('hi clear')
    if vim.g.syntax_on then
        vim.cmd('syntax reset')
    end

    vim.g.colors_name = 'mdr'
    vim.o.termguicolors = true

    for group, styles in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, styles)
    end
end

return M

" Vim color file
" https://github.com/khornberg/vim-monokai/blob/master/colors/monokai.vim
" http://bytefluent.com/vivify/
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" Modified by: Steve Losh <steve@stevelosh.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"
" Inspired by JarrodCTaylor/spartan
" for the more muted look
"
" Python refs (from Logan)
" PreProc   - import
" Statement - def, class, lambda, return, as, etc.

set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
set t_Co=256
let g:colors_name="monokai"

let purple            = { "gui": "#5f5fff", "cterm": "63"}
let yellow            = { "gui": "#d7d75f", "cterm": "185"}
let orange            = { "gui": "#af8700", "cterm": "136"}
let lightPurple       = { "gui": "#af5fff", "cterm": "135"}
let lightBlue         = { "gui": "#5fd7ff", "cterm": "81"}
let pink              = { "gui": "#ff005f", "cterm": "197"}
let darkRed           = { "gui": "#af00ff", "cterm": "129"}
let green             = { "gui": "#87d700", "cterm": "112"}

let seaGreen          = { "gui": "#00875f", "cterm": "29"}
let darkYellow        = { "gui": "#00afd7", "cterm": "38"}
let lightGreen        = { "gui": "#5f8787", "cterm": "66"}
let red               = { "gui": "#870000", "cterm": "88"}
let tan               = { "gui": "#87875f", "cterm": "101"}
let defaultBackground = { "gui": "#262626", "cterm": "235"}
let darkerGrey        = { "gui": "#262626", "cterm": "235"}
let darkGrey          = { "gui": "#303030", "cterm": "236"}
let grey              = { "gui": "#4e4e4e", "cterm": "239"}
let lightGrey         = { "gui": "#8a8a8a", "cterm": "245"}
let defaultForeground = { "gui": "#a8a8a8", "cterm": "248"}
let white             = { "gui": "#eeeeee", "cterm": "255"}

function! s:HL(item, fgColor, bgColor, style)
    execute 'hi ' . a:item . ' ctermfg=' . get(a:fgColor, 'cterm', 'none') . ' ctermbg=' . get(a:bgColor, 'cterm', 'none') . ' cterm=' . a:style . ' guibg=' . get(a:bgColor, 'gui', 'NONE') . ' guifg=' . get(a:fgColor, 'gui', 'NONE' . ' gui=' . a:style)
endfunction

call s:HL('Normal', defaultForeground, defaultBackground, 'NONE')
call s:HL('Folded', lightGrey, defaultBackground, 'NONE')
call s:HL('CursorLine', {}, darkGrey, 'NONE')
call s:HL('CursorColumn', lightGrey, darkerGrey, 'NONE')
call s:HL('ColorColumn', {}, darkGrey, 'NONE')
call s:HL('LineNr', lightGrey, defaultBackground, 'NONE')
call s:HL('FoldColumn', lightGrey, defaultBackground, 'NONE')
call s:HL('VertSplit', lightGrey, defaultBackground, 'NONE')
call s:HL('Search', darkGrey, white, 'NONE')
call s:HL('IncSearch', darkGrey, white, 'NONE')

call s:HL('Boolean', lightPurple, {}, 'NONE')
call s:HL('Comment', lightGrey, {}, 'NONE')
call s:HL('Character', tan, {}, 'NONE')
call s:HL('Number', lightPurple, {}, 'NONE')
call s:HL('String', yellow, {}, 'NONE')
call s:HL('Conditional', pink, {}, 'NONE')
call s:HL('Constant', lightPurple, {}, 'bold')
call s:HL('Debug', lightGrey, {}, 'NONE')
call s:HL('Define', lightBlue, {}, 'NONE')
call s:HL('Delimiter', lightGrey, {}, 'NONE')
call s:HL('Float', lightPurple, {}, 'NONE')
call s:HL('Function', green, {}, 'NONE')
call s:HL('Identifier', orange, {}, 'NONE')
call s:HL('Builtin', lightPurple, {}, 'NONE')

call s:HL('DiffAdd', green, {}, 'NONE')
call s:HL('DiffChange', darkYellow, {}, 'NONE')
call s:HL('DiffDelete', red, {}, 'NONE')
call s:HL('DiffText', grey, {}, 'NONE')

call s:HL('Cursor', defaultBackground, pink, 'NONE')
call s:HL('iCursor', defaultBackground, tan, 'NONE')
call s:HL('vCursor', defaultBackground, green, 'NONE')

call s:HL('EasyMotionTarget', yellow, defaultBackground, 'bold')
call s:HL('EasyMotionShade', grey, defaultBackground, 'bold')
call s:HL('Directory', lightGreen, {}, 'bold')
call s:HL('Error', {}, red, 'NONE')
call s:HL('ErrorMsg', pink, defaultBackground, 'bold')
call s:HL('Exception', seaGreen, {}, 'bold')
call s:HL('Ignore', lightGrey, defaultBackground, 'NONE')

call s:HL('Keyword', pink, {}, 'NONE')
call s:HL('Label', tan, {}, 'NONE')
call s:HL('Macro', tan, {}, 'NONE')
call s:HL('SpecialKey', lightBlue, {}, 'NONE')

call s:HL('InterestingWord1', defaultBackground, orange, 'NONE')
call s:HL('InterestingWord2', defaultBackground, seaGreen, 'NONE')
call s:HL('InterestingWord3', defaultBackground, pink, 'NONE')

call s:HL('MatchParen', yellow, {}, 'bold')
call s:HL('ModeMsg', tan, {}, 'NONE')
call s:HL('MoreMsg', tan, {}, 'NONE')
call s:HL('Operator', pink, {}, 'NONE')

call s:HL('Pmenu', lightGrey, defaultBackground, 'NONE')
call s:HL('PmenuSel', defaultBackground, lightGreen, 'NONE')
call s:HL('PmenuSbar', {}, defaultBackground, 'NONE')
call s:HL('PmenuThumb', lightGrey, {}, 'NONE')

call s:HL('PreCondit', lightGreen, {}, 'bold')
call s:HL('PreProc', pink, {}, 'NONE')
call s:HL('Question', lightBlue, {}, 'NONE')
call s:HL('Repeat', pink, {}, 'NONE')

call s:HL('IndentGuides', {}, darkGrey, 'NONE')
call s:HL('SignColumn', lightGreen, defaultBackground, 'NONE')
call s:HL('SpecialChar', pink, {}, 'NONE')
call s:HL('SpecialComment', grey, {}, 'NONE')
call s:HL('Special', lightBlue, {}, 'NONE')
call s:HL('SpecialKey', lightGrey, {}, 'NONE')
call s:HL('Statement', pink, {}, 'NONE')
call s:HL('StatusLine', defaultForeground, defaultBackground, 'NONE')
call s:HL('StatusLineNC', lightGrey, defaultBackground, 'NONE')
call s:HL('StorageClass', orange, {}, 'NONE')
call s:HL('Structure', lightBlue, {}, 'NONE')
call s:HL('Tag', pink, {}, 'NONE')
call s:HL('Title', pink, {}, 'NONE')
call s:HL('Todo', white, defaultBackground, 'NONE')

call s:HL('Typedef', lightBlue, {}, 'NONE')
call s:HL('Type', lightBlue, {}, 'NONE')
call s:HL('Underlined', lightGrey, {}, 'underline')

call s:HL('WarningMsg', white, defaultBackground, 'NONE')
call s:HL('WildMenu', lightBlue, {}, 'NONE')

call s:HL('MyTagListFileName', pink, {}, 'bold')

if has("spell")
    call s:HL('SpellBad', white, red, 'NONE')
    call s:HL('SpellCap', white, purple, 'NONE')
    call s:HL('SpellLocal', white,  lightGreen, 'NONE')
    call s:HL('SpellRare', white, {}, 'NONE')
endif

call s:HL('VisualNOS', {}, grey, 'NONE')
call s:HL('Visual', {}, grey, 'NONE')
call s:HL('SpecialKey', {}, grey, 'NONE')

call s:HL('pythonClassName', lightBlue, {}, 'NONE')
call s:HL('pythonParamName', orange, {}, 'NONE')
call s:HL('pythonFuncName', green, {}, 'NONE')
call s:HL('pythonSuperClass', green, {}, 'NONE')
call s:HL('pythonDecorator', pink, {}, 'NONE')
call s:HL('pythonClassDef', lightBlue, {}, 'NONE')
call s:HL('pythonFuncDef', lightBlue, {}, 'NONE')
call s:HL('pythonBuiltInFunc', lightBlue, {}, 'NONE')
call s:HL('pythonBuiltin', lightBlue, {}, 'NONE')
call s:HL('pythonKwargs', orange, {}, 'NONE')
call s:HL('pythonPreCondit', pink, {}, 'NONE')

" Javascript
call s:HL('javascriptFuncArg', orange, {}, 'NONE')
call s:HL('javascriptVariable', lightBlue, {}, 'NONE')
call s:HL('javascriptFuncKeyword', lightBlue, {}, 'NONE')
call s:HL('javascriptBlock', defaultForeground, {}, 'NONE')
call s:HL('javascriptOperator', pink, {}, 'NONE')
call s:HL('javascriptImport', pink, {}, 'NONE')
call s:HL('javascriptFuncComma', defaultForeground, {}, 'NONE')

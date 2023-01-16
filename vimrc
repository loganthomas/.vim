"Set Vim settings
"------------------------------------------------------------------------------
"colorscheme ron                 " Set colorscheme
"colorscheme monokai
colorscheme onehalfdark
"colorscheme onehalflight
set nocompatible                " Don't use Vi-compatible
set clipboard=unnamed           " Copy/paste to work properly
"set background=dark             " Use colors that work well with dark screen
set backspace=indent,eol,start  " Make backspace work correctly (over indents, line breaks, starts)
set encoding=utf-8              " Sets character encoding to UTF-8
set mouse=a                     " Enable mouse for Normal, Visual, Insert, CMD modes
set nowrap                      " Don't wrap lines
set noerrorbells                " No sounds on errors
set novisualbell                " No blinking on errors
set number                      " Show line numbers
set relativenumber              " Show line numbers in relation to current line
set ruler                       " Show line and column number of cursor
set showmatch                   " Show matching brackets
set showmode                    " Show if in Insert, Replace, Visual mode
set smartindent                 " Do smart indenting when adding new line
set spell                       " Enable spell check
set spelllang=en                " English used as spelling dictionary

nnoremap <C-j> <C-W><C-J>  " Control J moves down a screen
nnoremap <C-k> <C-W><C-K>  " Control K moves up a screen
nnoremap <C-l> <C-W><C-L>  " Control L moves right a screen
nnoremap <C-h> <C-W><C-H>  " Control H moves left a screen
"------------------------------------------------------------------------------


" Special settings with autocmd (au)
"------------------------------------------------------------------------------
" Set syntax coloring
if has("syntax")
    syntax on
endif

" Underline misspellings
hi clear SpellBad
hi SpellBad cterm=underline

" Jump to last position when reopening file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype
"if has("autocmd")
"    filetype plugin indent on
"endif


"When a .py file is read or the line text changes in normal or insert mode,
"draw a line marking the maximum line length if a line exceeds this length.
augroup PythonCommands
autocmd!
    autocmd BufRead,TextChanged,TextChangedI *.py call ShowColumnIfLineTooLong(100)
augroup END

"Color the column marking the length limit when the longest line in the file
"exceeds the length limit
" function! ShowColumnIfLineTooLong(lengthLimit)
"     let maxLineLength = max(map(getline(1, '$'), 'len(v:val)'))

"     if maxLineLength > a:lengthLimit
"         highlight ColorColumn ctermbg=red guibg=red
"         execute "set colorcolumn=" . (a:lengthLimit+1)
"     else
"         set colorcolumn=""
"     endif
" endfunction

function! ShowColumnIfLineTooLong(lengthLimit)
    highlight ColorColumn ctermbg=234 guibg=#272822
    let &colorcolumn="72,".join([a:lengthLimit])
endfunction


" For python PEP 8 indentation
if has("autocmd")
    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix
endif


" For other file indentations
if has("autocmd")
    au BufNewFile,BufRead *.js,*.html,*.css
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |
        \ set expandtab
endif


" For making .md files read as markdown
if has("autocmd")
    au BufNewFile,BufFilePre,BufRead *.md
        \ set filetype=markdown
endif


" For YAML files
if has("autocmd")
    au BufNewFile,BufRead *.{yaml,yml}
        \ set filetype=yaml |
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set expandtab |
        \ set autoindent |
        \ set formatoptions-=cro  " don't continue comment after ENTER
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
   "Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff
      autocmd BufNewFile,BufRead *.diff set filetype=diff

      autocmd Syntax diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

      autocmd Syntax gitcommit setlocal textwidth=74
endif
"------------------------------------------------------------------------------


" Plug-ins (VimPlug https://github.com/junegunn/vim-plug)
"------------------------------------------------------------------------------
" Adding vim-plug for managing plug-ins
call plug#begin()

    Plug 'scrooloose/nerdtree'
    Plug 'mhinz/vim-signify'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tsanch3z/indent-python.vim'
    " Plug 'scrooloose/syntastic'
    Plug 'kannokanno/previm'
    Plug 'tpope/vim-commentary'
    Plug 'godlygeek/tabular'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'dense-analysis/ale'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'vim-python/python-syntax'
    Plug 'maximbaz/lightline-ale'

call plug#end()

" Map nerd tree to cntrl+n (pressing control+n opens nerd tree)
:map <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1

" Specific for vim-signify
let g:signify_vcs_list = ['git']
let g:signify_sign_delete = "-"
let g:signify_sign_delete_first_line = "-"
let g:signify_realtime = 1
let g:signify_cursorhold_normal = 1
let g:signify_cursorhold_insert = 1
let g:signify_update_onfocusgained = 1
highlight SignifySignAdd    cterm=bold ctermbg=none ctermfg=green
highlight SignifySignDelete cterm=bold ctermbg=none ctermfg=red
highlight SignifySignChange cterm=bold ctermbg=none ctermfg=white
set updatetime=3500

" Specific for white-space
let g:strip_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Specific for ale
" Note on using flake8
"     pip show flake8
"     cd to the dir where flake8 is located
"     find defaults.py
"     add to IGNORE section
" Base EDM environment used for flake8 as no true Python on enthought macbook
" let g:ale_python_flake8_executable='/Users/lthomas/venvs/non-edm/bin/flake8'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
let g:ale_linters = {'python': ['flake8', 'mypy'],}
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_virtualtext_cursor = 0

" Specific for syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" let g:syntastic_style_error_symbol=">>"
" let g:syntastic_style_warning_symbol=">>"
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E501,E309,E231,E201,E202,E221,E203,E271,E272,E241,E251,W391'

" Sometimes in virtual env loading these filetypes is too slow
" let g:syntastic_mode_map={
"       \ "mode": "active",
"       \ "passive_filetypes": ["markdown", "yaml", "json", "tcl"] }

" Specific for markdown preview (previm)
let g:previm_open_cmd='open -a Google\ Chrome'
" let g:previm_open_cmd='start chrome'
" let g:previm_enable_realtime=1

" Specific to python-syntax
let g:python_highlight_all=1
" Specific for lightline (uses vim-gitbranch)
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \            [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Specific for lightline-ale
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

"-------------------------
